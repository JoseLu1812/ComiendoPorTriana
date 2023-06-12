import { Component, OnInit } from '@angular/core';
import { BaresList } from 'src/app/interfaces/bares.interface';
import { BarService } from 'src/app/services/bar.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-bares-list',
  templateUrl: './bares-list.component.html',
  styleUrls: ['./bares-list.component.css'],
})
export class BaresListComponent {
  baresList: BaresList = {} as BaresList;
  page: number = 0;

  constructor(private barService: BarService) {}

  ngOnInit(): void {
    this.barService.getBaresListConPaginacion(this.page).subscribe((resp) => {
      this.baresList = resp;
    });
  }

  changePage(page: number) {
    this.barService.getBaresListConPaginacion(page).subscribe((resp) => {
      this.baresList = resp;
    });
  }

  counter() {
    return new Array(this.baresList.totalPages);
  }

  getBarImage(img: string) {
    return `${environment.apiImgUrl}${img}`;
  }
}
