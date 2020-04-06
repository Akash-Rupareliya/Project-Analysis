import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
  styleUrls: ['./student-list.component.css']
})
export class StudentListComponent implements OnInit {
  result:any;
  constructor(private http:HttpClient) { }

  ngOnInit() {
    this.http.get('https://localhost:44394/api/student').subscribe(res=>{
      this.result=res;
      console.log(this.result);
    })
  }

}
