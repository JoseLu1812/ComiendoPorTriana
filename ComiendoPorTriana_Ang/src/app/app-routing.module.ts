import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BaresListComponent } from './components/bares/bares-list/bares-list.component';
import { LoginComponent } from './components/login/login.component';
import { BarDetailsComponent } from './components/bares/bar-details/bar-details.component';
import { UserListComponent } from './components/users/user-list/user-list.component';

const routes: Routes = [
  { path: 'login', component: LoginComponent},
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'restaurantes', component: BaresListComponent },
  { path: 'restaurantes/:barId', component: BarDetailsComponent },
  { path: 'users', component: UserListComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
