import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BaresList } from '../interfaces/bares.interface';
import { environment } from 'src/environments/environment';
import { Bar } from '../interfaces/bares.interface';


@Injectable({
  providedIn: 'root',
})
export class BarService {
  constructor(private http: HttpClient) {}

  getBaresList(): Observable<BaresList> {
    return this.http.get<BaresList>(`${environment.apiBaseUrl}bar`);
  }

  getOneBar(id: string): Observable<Bar> {
    return this.http.get<Bar>(`${environment.apiBaseUrl}bar/${id}`);
  }

  getBaresListConPaginacion(page: number): Observable<BaresList> {
    return this.http.get<BaresList>(`${environment.apiBaseUrl}bar?page=${page}`);
  }
}
