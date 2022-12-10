// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    // Max number of whitelisted addresses allowed
    // İzin verilen maksimum whitelist adresi sayısı
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of whitelistedAddresses
    // Beyaz listedeki Adreslerin bir eşlemesini oluşturun
    // if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
    // bir adres beyaz listeye alınmışsa, onu true olarak ayarlarız, diğer tüm adresler için varsayılan olarak false.
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    // numAddressesWhitelisted, kaç adresin beyaz listeye alındığını takip etmek için kullanılır
    // NOTE: Don't change this variable name, as it will be part of verification
    // NOT: Doğrulamanın bir parçası olacağından bu değişken adını değiştirmeyin.
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // Beyaz listedeki maksimum adres sayısını ayarlama
    // User will put the value at the time of deployment
    // Kullanıcı, dağıtım sırasında değeri girer
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
     * addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */
    /**
     * addAddressToWhitelist - Bu işlev gönderenin adresini beyaz listeye ekler
     */
     function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        // kullanıcının zaten beyaz listeye alındığını kontrol edin
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        // numAddressesWhitelisted < maxWhitelistedAddresses olup olmadığını kontrol edin, değilse bir hata fırlatın.
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
        // Add the address which called the function to the whitelistedAddress array
        // Fonksiyonu çağıran adresi beyaz listedeki adres dizisine ekleyin
        whitelistedAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses
        // Beyaz listeye alınan adreslerin sayısını artırın
        numAddressesWhitelisted += 1;
     }
}