import { Component, OnInit } from '@angular/core';
import { BaresList } from 'src/app/interfaces/bares.interface';
import { BarService } from 'src/app/services/bar.service';

@Component({
  selector: 'app-initial-page',
  templateUrl: './initial-page.component.html',
  styleUrls: ['./initial-page.component.css']
})
export class InitialPageComponent implements OnInit{

  constructor() { }

  ngOnInit(): void {

  }

}
