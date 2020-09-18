from talon import keychain, Module, Context, actions

def find(chain, name):
    return keychain.find(chain, name)

mod = Module('Find keychain entries')
@mod.action_class
class Actions:
    def keychain_find(chain: str, name: str) -> str:
        """This queries the keychain."""
        return find(chain, name)

