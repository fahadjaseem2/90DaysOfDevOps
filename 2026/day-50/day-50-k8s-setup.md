# 🚀 Kubernetes Story – Quick Recall

## ❓ Why was Kubernetes created?
To manage containers at scale.

Docker runs containers, but Kubernetes handles:
- Scaling
- Load balancing
- Self-healing
- Deployment across multiple machines

---

## 👨‍💻 Who created it?
Created by **Google**, inspired by **Borg**.

---

## 📖 Meaning of Kubernetes
Greek word meaning **"Helmsman" (Pilot)** 🚢

---

## ✅ Summary
- Docker = Run containers  
- Kubernetes = Manage containers at scale  

---

## 📌 Task 2: Kubernetes Architecture

### 🧠 Control Plane
- **API Server** → Entry point for all commands  
- **etcd** → Stores cluster state  
- **Scheduler** → Assigns pods to nodes  
- **Controller Manager** → Maintains desired state  

### ⚙️ Worker Node
- **kubelet** → Manages pods on node  
- **kube-proxy** → Handles networking  
- **Container Runtime** → Runs containers (containerd, CRI-O)  

---

## 🔄 Flow (kubectl apply)
1. User runs `kubectl apply`
2. Request goes to **API Server**
3. State stored in **etcd**
4. **Scheduler** assigns node
5. **kubelet** runs pod on worker node

---

## ⚠️ Failure Scenarios
- **API Server down** → Cluster becomes unmanageable  
- **Worker node down** → Pods rescheduled to other nodes  

---

## ✅ Output
- Local cluster (kind/minikube) running  
- Verified using: `kubectl get nodes`  get-context

---

## 🔍 Task 5: Explore Your Cluster

### 📌 Commands Used

```bash
# Cluster info
kubectl cluster-info

# List nodes
kubectl get nodes

# Describe node
kubectl describe node <node-name>

# List namespaces
kubectl get namespaces

# All pods in cluster
kubectl get pods -A
```

---

## 🔁 Task 6: Practice Cluster Lifecycle

### 📌 Cluster Operations

```bash
# Delete cluster
kind delete cluster --name devops-cluster
# (or: minikube delete)

# Recreate cluster
kind create cluster --name devops-cluster
# (or: minikube start)

# Verify cluster
kubectl get nodes

# Current context (active cluster)
kubectl config current-context

# List all contexts
kubectl config get-contexts

# View kubeconfig file
kubectl config view

```

