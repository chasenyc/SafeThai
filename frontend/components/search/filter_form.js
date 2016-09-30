const React = require('react');

const _handleChange = (filter, updateFilter) => (
  e => updateFilter(filter, e.currentTarget.value)
)

const FilterForm = ({minGrade, maxGrade, updateFilter}) => (
  <div>
    <span className="filter">Filter results:</span>
    <br/>
    <label>Minimum Grade </label>
      <select value={minGrade} onChange={_handleChange('minGrade', updateFilter)}>
        <option value="A">A</option>
        <option value="B">B</option>
        <option value="C">C</option>
        <option value="D">D</option>
      </select>
     <br/>
    <label>Maximum Grade </label>
    <select value={maxGrade} onChange={_handleChange('maxGrade', updateFilter)}>
      <option value="A">A</option>
      <option value="B">B</option>
      <option value="C">C</option>
      <option value="D">D</option>
    </select>
  </div>
);

export default FilterForm;
