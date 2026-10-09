package com.gardenconnect.dao;

import com.gardenconnect.model.Question;
import com.gardenconnect.model.Answer;
import com.gardenconnect.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
    public void create(int userId, String title, String description) throws SQLException {
        String sql = "INSERT INTO questions(user_id,title,description) VALUES(?,?,?)";
        try (Connection con=DBConnection.getConnection(); PreparedStatement ps=con.prepareStatement(sql)) {
            ps.setInt(1,userId); ps.setString(2,title); ps.setString(3,description); ps.executeUpdate();
        }
    }

    public List<Question> findAll() throws SQLException {
        String sql = """
            SELECT q.question_id,q.user_id,u.name,q.title,q.description,q.created_at,
                   (SELECT COUNT(*) FROM answers a WHERE a.question_id=q.question_id) answer_count
            FROM questions q JOIN users u ON q.user_id=u.user_id ORDER BY q.created_at DESC
            """;
        List<Question> list=new ArrayList<>();
        try(Connection con=DBConnection.getConnection(); PreparedStatement ps=con.prepareStatement(sql); ResultSet rs=ps.executeQuery()){
            while(rs.next()){
                Question q=new Question();
                q.setQuestionId(rs.getInt("question_id")); q.setUserId(rs.getInt("user_id"));
                q.setAuthorName(rs.getString("name")); q.setTitle(rs.getString("title"));
                q.setDescription(rs.getString("description")); q.setCreatedAt(rs.getTimestamp("created_at"));
                q.setAnswerCount(rs.getInt("answer_count")); list.add(q);
            }
        }
        return list;
    }

    public Question findById(int id) throws SQLException {
        String sql="SELECT q.question_id,q.user_id,u.name,q.title,q.description,q.created_at FROM questions q JOIN users u ON q.user_id=u.user_id WHERE q.question_id=?";
        try(Connection con=DBConnection.getConnection(); PreparedStatement ps=con.prepareStatement(sql)){
            ps.setInt(1,id);
            try(ResultSet rs=ps.executeQuery()){
                if(rs.next()){
                    Question q=new Question();
                    q.setQuestionId(rs.getInt("question_id")); q.setUserId(rs.getInt("user_id"));
                    q.setAuthorName(rs.getString("name")); q.setTitle(rs.getString("title"));
                    q.setDescription(rs.getString("description")); q.setCreatedAt(rs.getTimestamp("created_at")); return q;
                }
            }
        }
        return null;
    }

    public void addAnswer(int questionId,int userId,String answer) throws SQLException{
        String sql="INSERT INTO answers(question_id,user_id,answer) VALUES(?,?,?)";
        try(Connection con=DBConnection.getConnection(); PreparedStatement ps=con.prepareStatement(sql)){
            ps.setInt(1,questionId); ps.setInt(2,userId); ps.setString(3,answer); ps.executeUpdate();
        }
    }

    public List<Answer> findAnswers(int questionId) throws SQLException{
        String sql="SELECT a.answer_id,a.question_id,a.user_id,u.name,a.answer,a.created_at FROM answers a JOIN users u ON a.user_id=u.user_id WHERE a.question_id=? ORDER BY a.created_at";
        List<Answer> list=new ArrayList<>();
        try(Connection con=DBConnection.getConnection(); PreparedStatement ps=con.prepareStatement(sql)){
            ps.setInt(1,questionId);
            try(ResultSet rs=ps.executeQuery()){
                while(rs.next()){
                    Answer a=new Answer();
                    a.setAnswerId(rs.getInt("answer_id")); a.setQuestionId(rs.getInt("question_id")); a.setUserId(rs.getInt("user_id"));
                    a.setAuthorName(rs.getString("name")); a.setAnswer(rs.getString("answer")); a.setCreatedAt(rs.getTimestamp("created_at")); list.add(a);
                }
            }
        }
        return list;
    }

    public int getOwnerId(int questionId) throws SQLException {
        try(Connection con=DBConnection.getConnection(); PreparedStatement ps=con.prepareStatement("SELECT user_id FROM questions WHERE question_id=?")){
            ps.setInt(1,questionId); try(ResultSet rs=ps.executeQuery()){ return rs.next()?rs.getInt(1):-1; }
        }
    }
}
