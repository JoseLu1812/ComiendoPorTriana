import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Bar, BaresList } from 'src/app/interfaces/bares.interface';
import { AuthService } from 'src/app/services/auth.service';
import { BarService } from 'src/app/services/bar.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-bares-list',
  templateUrl: './bares-list.component.html',
  styleUrls: ['./bares-list.component.css'],
})
export class BaresListComponent {
  listPagination: BaresList = {} as BaresList;
  baresList: Bar[] = [];
  page: number = 0;
  totalPages: number = 0;
  numBares: number = 0;

  constructor(
    private barService: BarService,
    private authService: AuthService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.barService.getBaresListConPaginacion(this.page).subscribe((resp) => {
      this.listPagination = resp;
      this.baresList = this.listPagination.content;
      this.totalPages = this.listPagination.totalPages;
    });
  }

  onScroll(): void {
    this.barService.getBaresListConPaginacion(++this.page).subscribe((resp) => {
      this.baresList.push(...resp.content);
    });
  }

  counter() {
    return new Array(this.listPagination.totalPages);
  }

  getBarImage(img: string) {
    return `${environment.apiImgUrl}${img}`;
  }

  logOut() {
    this.authService.logOut();
    this.router.navigate(['']);
  }
}
