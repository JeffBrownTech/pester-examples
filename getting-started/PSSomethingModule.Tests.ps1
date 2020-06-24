Import-Module .\PSSomethingModule.psm1 -Force

Describe "Get-Something" {
    Context "when parameter ThingToGet is not used" {
        It "should return 'I got something!'" {
            Get-Something | Should -Be 'I got something!'
        }
    }

    Context "when parameter ThingToGet is used" {
        It "should return 'I got ' follow by a string" {
            $thing = 'a dog'
            Get-Something -ThingToGet $thing | Should -Be "I got $thing!"
        }
    }
}
