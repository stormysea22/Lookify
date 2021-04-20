package com.theismann.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.theismann.lookify.models.Song;
import com.theismann.lookify.services.SongService;

@Controller
public class SongController {
	private final SongService songService;
	
	public SongController(SongService service) {
		this.songService = service;
	}
	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	
	@RequestMapping("/dashboard")
	public String dashboard(@ModelAttribute("songTitle") Song song, Model model) {
		model.addAttribute("allSongs", this.songService.allSongs());
		return "dashboard.jsp";
	}
	
	@RequestMapping("/songs/new")
	public String newSong(@ModelAttribute("song") Song song) {
		return "new.jsp";
	}
	
	@RequestMapping(value="/songs/create", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("song") Song song, BindingResult result) {
        if (result.hasErrors()) {
            return "new.jsp";
        } else {
            songService.createSong(song);
            return "redirect:/dashboard";
        }
	}
        
    @RequestMapping("/songs/{id}")
        public String showOne(@PathVariable("id")Long id, Model model) {
    		Song showSong = songService.findSong(id);
    		model.addAttribute("showSong", showSong);
    		return "show.jsp";
    }
    
    @RequestMapping("/songs/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Song song = songService.findSong(id);
        model.addAttribute("song", song);
        return "edit.jsp";
    }
    
    @RequestMapping(value="/songs/{id}/update", method=RequestMethod.POST)
    public String update(@Valid @ModelAttribute("songName") Song song, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
        	this.songService.updateSong(song);
            return "redirect:/dashboard";
        }
    }
    
    @RequestMapping(value="/songs/{id}/delete")
    public String destroy(@PathVariable("id") Long id) {
        songService.deleteSong(id);
        return "redirect:/dashboard";
    }
    
    @RequestMapping("/search/topten")
    public String topTen(Model model) {
    	List<Song> top = songService.topTen();
    	model.addAttribute("top", top);
    	return "topTen.jsp";
    }
    
    @RequestMapping("/search")
    public String search(@ModelAttribute("songName") Song song) {
    	return "redirect:/search/"+ song.getArtist();
    }
    
    @RequestMapping("/search/{search}")
    public String result(@ModelAttribute("songName") Song song, @PathVariable("search") String search, Model model) {
    	List<Song> results = songService.searchBy(search);
    	System.out.println(results);
    	model.addAttribute("search", search);
    	model.addAttribute("results", results);
    	return "search.jsp";
    }
}
