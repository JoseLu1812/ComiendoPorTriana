import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'src/app/interfaces/user.interface';
import { AuthService } from 'src/app/services/auth.service';
import { UserService } from 'src/app/services/user.service';


@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css'],
})
export class UserListComponent implements OnInit {
  userList: User[] = [];
  resultsLength: number = 0;

  constructor(
    private userService: UserService,
    private authService: AuthService,
    private router: Router
  ) {}

  ngOnInit() {
    this.getUsers();
  }
  
  getUsers() {
    this.userService.getAllUsers().subscribe((resp) => {
      this.userList = resp;
      this.resultsLength = resp.length;
    });
  }

  logOut() {
    this.authService.logOut();
    this.router.navigate(['']);
  }
}
