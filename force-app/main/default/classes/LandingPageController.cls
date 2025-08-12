/**
 * @description       : 
 * @author            : Leonardo Luna 
 * @group             : 
 * @last modified on  : 08-12-2025
 * @last modified by  : Leonardo Luna 
**/
public with sharing class LandingPageController {
    /**
    * @description Retrieves the list of recently added albums.
    * @author Leonardo Luna  | 08-12-2025 
    * @return List<Album__c> 
    **/
    @AuraEnabled(cacheable=true)
    public static List<Album__c> getRecentAlbums() {
        try {
            return AlbumSelector.getAlbums();
        } catch (Exception e) {
            System.debug('Error in getRecentAlbums: ' + e.getMessage());
            throw new AuraHandledException('An unexpected error occurred.');
        }
    }

    /**
    * @description Retrieves the list of songs scheduled for upcoming release.
    * @author Leonardo Luna  | 08-12-2025
    * @return List<Song__c>
    **/
    @AuraEnabled(cacheable=true)
    public static List<Song__c> getUpcomingSongs() {
        try {
            return SongSelector.getUpcomingSongs();
        } catch (Exception e) {
            System.debug('Error in getUpcomingSongs: ' + e.getMessage());
            throw new AuraHandledException('An unexpected error occurred.');
        }
    }

    /**
    * @description Retrieves the next set of songs to be played, limited by the provided size.
    * @author Leonardo Luna  | 08-12-2025
    * @param limitSize Number of songs to retrieve.
    * @return List<Song__c>
    **/
    @AuraEnabled(cacheable=true)
    public static List<Song__c> getNextSongs(Integer limitSize) {
        try {
            return SongSelector.getNextSongs(limitSize);
        } catch (Exception e) {
            System.debug('Error in getNextSongs: ' + e.getMessage());
            throw new AuraHandledException('An unexpected error occurred.');
        }
    }

    /**
    * @description Retrieves all playlists created by the specified user.
    * @author Leonardo Luna  | 08-12-2025
    * @param userId The ID of the user whose playlists will be retrieved.
    * @return List<Playlist__c>
    **/
    @AuraEnabled(cacheable=true)
    public static List<Playlist__c> getUserPlaylists(Id userId) {
        try {
            return PlaylistSelector.getPlaylistsFromUser(userId);
        } catch (Exception e) {
            System.debug('Error in getUserPlaylists: ' + e.getMessage());
            throw new AuraHandledException('An unexpected error occurred.');
        }
    }

    /**
    * @description Retrieves all private playlists belonging to the specified user.
    * @author Leonardo Luna  | 08-12-2025
    * @param userId The ID of the user whose private playlists will be retrieved.
    * @return List<Playlist__c>
    **/
    @AuraEnabled(cacheable=true)
    public static List<Playlist__c> getUserPrivatePlaylists(Id userId) {
        try {
            return PlaylistSelector.getPrivatePlaylists(userId);
        } catch (Exception e) {
            System.debug('Error in getUserPrivatePlaylists: ' + e.getMessage());
            throw new AuraHandledException('An unexpected error occurred.');
        }
    }

    /**
    * @description Retrieves a list of all artists in the system.
    * @author Leonardo Luna  | 08-12-2025
    * @return List<Artist__c>
    **/
    @AuraEnabled(cacheable=true)
    public static List<Artist__c> getAllArtists() {
        try {
            return ArtistSelector.getAllArtists();
        } catch (Exception e) {
            System.debug('Error in getAllArtists: ' + e.getMessage());
            throw new AuraHandledException('An unexpected error occurred.');
        }
    } 
}