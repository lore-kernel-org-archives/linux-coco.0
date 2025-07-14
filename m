Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20BE27815E
	for <linux-coco@lists.linux.dev>; Mon, 14 Jul 2025 22:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752531351; cv=none; b=X9/dqtipY7dXsPA4ofgtC9gVTMwxp1HFaAmXWyFf+ZZddoYU0Whoo7c798un7XnRWVLsOJPLRkxAPa8CG0OEByUZArUXaKv6V1RVVxZLthQ+P7E7SsqRN+54NodBX3VLEtHxBvJd+YkvGuQKF5Slh/hU131vrQwp2kF1MDRiW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752531351; c=relaxed/simple;
	bh=PDoW0cTwMd+zaYHHMOCKb9goqInwTZCebB8VI+uMRE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhft5moIjXiY0bzQmch/rVkzdKuo9gAE9aPFn0vyRPtjzxDesXOE7MQObOnwrEMVeovf8iAtsff0cZzXnowydASDAirLmwZsvYSZFQsUq7ua5BMR+0uGfBDwxtlppIXMgg/PxTlfsINkis+Q/dwtiPkHMHZrdYw953gVJPX5+/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=D/4xcalO; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="D/4xcalO"
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id D37A52016592;
	Mon, 14 Jul 2025 15:15:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D37A52016592
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1752531349;
	bh=2Uj5+MWRT6Nrb2e5uPnnI56BMuCGOG4Pghr4svS0DvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D/4xcalOyAiEZbazwtk4xGsxXLYvYZuuLwvfe/OzzaZpYr0LDrg9/j0DBkx5JZpPk
	 xkrIRZbDUy1z46KfVEcAS8sV3qlJvlP/L52HatvDPz0o1uGiN/eq297peiCS6Q+INy
	 hSRPS8RCx4tGFYbtI1OyI8+t7PRmtTVl3UUmCC10=
From: Roman Kisel <romank@linux.microsoft.com>
To: alok.a.tiwari@oracle.com,
	arnd@arndb.de,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	kys@microsoft.com,
	mhklinux@outlook.com,
	mingo@redhat.com,
	rdunlap@infradead.org,
	tglx@linutronix.de,
	Tianyu.Lan@microsoft.com,
	wei.liu@kernel.org,
	linux-arch@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v4 07/16] Drivers: hv: Post messages through the confidential VMBus if available
Date: Mon, 14 Jul 2025 15:15:36 -0700
Message-ID: <20250714221545.5615-8-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250714221545.5615-1-romank@linux.microsoft.com>
References: <20250714221545.5615-1-romank@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the confidential VMBus is available, the guest should post
messages to the paravisor.

Update hv_post_message() to post messages to the paravisor rather than
through GHCB or TD calls.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
---
 drivers/hv/hv.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
index e9ee0177d765..816f8a14ff63 100644
--- a/drivers/hv/hv.c
+++ b/drivers/hv/hv.c
@@ -74,7 +74,11 @@ int hv_post_message(union hv_connection_id connection_id,
 	aligned_msg->payload_size = payload_size;
 	memcpy((void *)aligned_msg->payload, payload, payload_size);
 
-	if (ms_hyperv.paravisor_present) {
+	if (ms_hyperv.paravisor_present && !vmbus_is_confidential()) {
+		/*
+		 * If the VMBus isn't confidential, use the CoCo-specific
+		 * mechanism to communicate with the hypervisor.
+		 */
 		if (hv_isolation_type_tdx())
 			status = hv_tdx_hypercall(HVCALL_POST_MESSAGE,
 						  virt_to_phys(aligned_msg), 0);
@@ -85,6 +89,11 @@ int hv_post_message(union hv_connection_id connection_id,
 		else
 			status = HV_STATUS_INVALID_PARAMETER;
 	} else {
+		/*
+		 * If there is no paravisor, this will go to the hypervisor.
+		 * In the Confidential VMBus case, there is the paravisor
+		 * to which this will trap.
+		 */
 		status = hv_do_hypercall(HVCALL_POST_MESSAGE,
 					 aligned_msg, NULL);
 	}
-- 
2.43.0

