/*
 * Copyright (C) 2020  GreenWaves Technologies, SAS
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* 
 * Authors: Francesco Conti, University of Bologna & GreenWaves Technologies (f.conti@unibo.it)
 */

#include <ne16.hpp>

void Ne16::debug_x_buffer() {
    std::ostringstream stringStream;
    stringStream << "x_buffer[8,8,32] = \n" << (this->trace_format?std::hex:std::dec) << std::setw(2) << xt::view(this->x_buffer,xt::all(),xt::all(),xt::all()) << std::dec << "\n";
    std::string copyOfStr = stringStream.str();
    this->trace.msg(vp::trace::LEVEL_DEBUG, copyOfStr.c_str());
}

void Ne16::debug_x_array() {
    std::ostringstream stringStream;
    stringStream << "x_array[36,9,32] = \n" << xt::print_options::threshold(10000) << (this->trace_format?std::hex:std::dec) << std::setw(2) << xt::view(this->x_array,xt::all(),xt::all(),xt::all()) << std::dec << "\n";
    std::string copyOfStr = stringStream.str();
    this->trace.msg(vp::trace::LEVEL_DEBUG, copyOfStr.c_str());
}

void Ne16::debug_accum(){
  std::ostringstream stringStream;
  stringStream << "accum[32,36] = \n" << (this->trace_format?std::hex:std::dec) << std::setw(8) << xt::view(this->accum,xt::all(),xt::all()) << std::dec << "\n";
  std::string copyOfStr = stringStream.str();
  this->trace.msg(vp::trace::LEVEL_DEBUG, copyOfStr.c_str());
}

void Ne16::debug_psum_block(){
  std::ostringstream stringStream;
  stringStream << "psum_block[36,9] = \n" << (this->trace_format?std::hex:std::dec) << std::setw(8) << xt::cast<int32_t>(this->psum_block) << std::dec << "\n";
  std::string copyOfStr = stringStream.str();
  this->trace.msg(vp::trace::LEVEL_DEBUG, copyOfStr.c_str());
}
