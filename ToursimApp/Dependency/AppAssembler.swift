// 
//  AppAssembler.swift
//  ToursimApp
//
//  Created by Rizky Mashudi on 30/05/22.
//

import Foundation

protocol Assembler: HomeAssembler,
                    ProfileAssembler {}

class AppAssembler: Assembler {}
