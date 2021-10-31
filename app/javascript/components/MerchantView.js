import React from "react"
import axios from 'axios'

class MerchantView extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      merchants: this.props.merchants.data,
      page: this.props.page
    }
  }

  nextPage() {
    let page = this.state.page + 1
    this.pageInfo(page)
  }

  previousPage() {
    let page = this.state.page - 1
    this.pageInfo(page)
  }

  pageInfo(page) {
    axios.get(`/merchants?page=${page}`, {
      headers: { 'Accept': 'application/json' }
    })
      .then(response => {
        const data = response.data

        this.setState({
          merchants: data.merchants.data,
          page: page
        })
      })
  }

  merchantList() {
    return this.state.merchants.map((merchant) =>
        <li><a href={`/merchants/${merchant.id}`} class="link link-dark">{ merchant.attributes.name }</a></li>
    )
  }

  render () {
    let currPage = this.state.merchants
    return (
      <>
      <button onClick={this.previousPage.bind(this)} class="btn btn-outline-danger btn-sm">Previous</button>
      <button onClick={this.nextPage.bind(this)} class="btn btn-outline-success btn-sm">Next</button>
      <p><b>Page: { this.state.page }</b></p>
      <ul>{ this.merchantList() }</ul>
      </>
    )
  }
}

export default MerchantView
