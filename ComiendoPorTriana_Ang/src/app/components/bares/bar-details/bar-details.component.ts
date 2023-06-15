import { Component, OnInit, Input } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Bar } from 'src/app/interfaces/bares.interface';
import { AuthService } from 'src/app/services/auth.service';
import { BarService } from 'src/app/services/bar.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-bar-details',
  templateUrl: './bar-details.component.html',
  styleUrls: ['./bar-details.component.css'],
})
export class BarDetailsComponent implements OnInit {
  bar: Bar | undefined;
  barId: string = '0';
  urlImage: string = '';

  constructor(
    private route: ActivatedRoute,
    private barService: BarService,
    private authService: AuthService,
    private router: Router
  ) {}

  ngOnInit() {
    const routeParams = this.route.snapshot.paramMap;
    this.barId = String(routeParams.get('barId'));
    this.getBarDetail(this.barId);
  }

  getBarDetail(id: string) {
    this.barService.getOneBar(id).subscribe((resp) => {
      this.bar = resp;
    });
  }

  getBarImage(img?: string) {
    return `${environment.apiImgUrl}${img}`;
  }

  logOut() {
    this.authService.logOut();
    this.router.navigate(['']);
  }
}


