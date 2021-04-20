package com.theismann.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.theismann.lookify.models.Song;
import com.theismann.lookify.repositories.SongRepository;

@Service
public class SongService {
    private final SongRepository songRepository;
    
    //this is constructor
    public SongService(SongRepository songRepository) {
        this.songRepository = songRepository;
    }
    // returns all the books
    public List<Song> allSongs() {
        return songRepository.findAll();
    }
    // creates a book
    public Song createSong(Song s) {
        return songRepository.save(s);
    }
    // retrieves a book
    public Song findSong(Long id) {
        Optional<Song> optionalSong = songRepository.findById(id);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        } else {
            return null;
        }
    }
     // update book
	public Song updateSong(Long id, String title, String artist, Integer rating) {
		Song toUpdate = this.songRepository.findById(id).orElse(null);
		if(toUpdate == null) {
			return null;
		} else{
			toUpdate.setTitle(title);
			toUpdate.setArtist(artist);
			toUpdate.setRating(rating);
			
		 return this.songRepository.save(toUpdate);
		}
	}
	
	public Song updateSong(Song song) {
		return this.songRepository.save(song);
	}
	
	public void deleteSong(Long id) {
		this.songRepository.deleteById(id);		
	}
	
	public List<Song> topTen() {
		return this.songRepository.findTop10ByOrderByRatingDesc();
	}
	
	public List<Song> searchBy(String search) {
		return this.songRepository.findByArtistContainsAllIgnoreCase(search);
	}
}
