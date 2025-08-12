/**
 * @description       : This class provides methods to retrieve artists from the Artist__c custom object.
 * @author            : Leonardo Luna 
 * @group             : 
 * @last modified on  : 08-11-2025
 * @last modified by  : Leonardo Luna 
**/
public with sharing class ArtistSelector {
     public static List<Artist__c> getAllArtists() {
        return [
            SELECT Id, Name, Genre__c
            FROM Artist__c
            ORDER BY Name ASC
        ];
    }

    // Get artist by Id
    public static Artist__c getArtistById(Id artistId) {
        List<Artist__c> artists = [
            SELECT Id, Name, Genre__c
            FROM Artist__c
            WHERE Id = :artistId
            LIMIT 1
        ];
       
    }

    // Get artists by genre
    public static List<Artist__c> getArtistsByGenre(String genre) {
        return [
            SELECT Id, Name, Genre__c
            FROM Artist__c
            WHERE Genre__c = :genre
            ORDER BY Name ASC
        ];
    }
}