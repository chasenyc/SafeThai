import { connect } from 'react-redux';
import Search from './search';
// Actions
import { updateFilter } from '../../actions/filter_actions';
// Selectors
import { asArray } from '../../reducers/selectors';

const mapStateToProps = state => ({
  restaurants: asArray(state.restaurants),
  minGrade: state.filters.minGrade,
  maxGrade: state.filters.maxGrade
});

const mapDispatchToProps = dispatch => ({
  updateFilter: (filter, value) => dispatch(updateFilter(filter, value))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
