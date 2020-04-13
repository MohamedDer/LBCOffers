## LBCOffers

LBCOffers picks some Leboncoin offers and lists them to the user.  
The main purpose behind the project is to write a clean, testable, single responsibilty code.

It was a good initiation to practice unit tests, especially for asynchronous calls. 

### Remarks
- All views were created by code. No xibs or storyboards.
- No external libraries were used. All code (network calls, JSON/Model parsin, image downloading...) is done using Apple native libraries.
- A network service layer is added to facilitate dependecy injection later.
- Some other features as offer details, pass data between VCs or filtering are already implemented in other app : [MyUsers](https://github.com/MohamedDer/MyUsers), [HPLibrary](https://github.com/MohamedDer/HPLibrary) or [Tableview sorting](https://github.com/MohamedDer/Tableview-Sorting). So, I don't feel the need to reimplement tyhem again. 
