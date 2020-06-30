Import-Module .\PSSomethingModule.psm1 -Force

Describe "Get-Something" {
    Context "verify module has defined functions" {
        $moduleFunctions = (Get-Module PSSSomethingModule).ExportedFunctions.Keys
        
        it "should have a Get-Something function" {
            $moduleFunctions | Should -Contain 'Get-Something'
        }
    }
    
    Context "testing parameter ThingToGet" {
        It "should have a parameter named ThingToGet" {
            Get-Command Get-Something | Should -HaveParameter ThingToGet -Type String
            Get-Command Get-Something | Should -HaveParameter ThingToGet -DefaultValue "something"
            Get-Command Get-Something | Should -HaveParameter ThingToGet -Not -Mandatory
        }
    }    
    
    Context "when parameter ThingToGet is not used" {
        It "should return 'I got something!'" {
            Get-Something | Should -Be 'I got something!'
        }

        It "should be a string" {
            Get-Something | Should -BeOfType System.String
        }
    }

    Context "when parameter ThingToGet is used" {
        $thing = 'a dog'
        
        It "should return 'I got' follow by parameter value" {
            Get-Something -ThingToGet $thing | Should -Be "I got $thing!"
        }

        It "should be a string" {
            Get-Something -ThingToGet $thing | Should -BeOfType System.String
        }
    }
}
