Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922481;
	b=gM7XLeAkp1RJ+4c9tZrQ5O4bPWutnQR/LmRVSVhuS7se/vy8rxmdWbHY/lXuUciuqR8O
	 QyixwsTFSp+RcecyXEmhzZduwjuKLhMOodwF4RGyKMmECMZ7/IrW2HGKMpumw5jwQ34gi
	 7a1Ggt2y2rTro9bWs2JPfnlajITrXmfwN52nL53yOhhEzHKkWvAYjOufxKHV+aY/4u2qi
	 iweXkvZBmiy5DPyKanoIN6wP8J1zFaz8lA5ChsZnrLRfgJ/FP8AQo+BOmQEq2RjT73lsF
	 BVKX+ISME83VC6dtrPjaGAwgf3BAERgwxZLArrYrA/CRvIxnz/kDjT5d6l+CrcES0fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1FN4tBVcJFBQsla2n8tME6jrjpUGnwmxW8ysKp7MZ+A=;
	b=SR9C11ajdZCccH3Ni2MCUtdly9bB2BjJwZZ4px4ihP1zHLNxUEWKh/GjwsX6OuvI3raC
	 CwEZ4a9Pv6h509JAQYE6sYJuQ/pMdhT74sdavUT5xt3myJ8sm5/QJuNwS4yh1ueMXIuGv
	 w3T9/rZokH2y57Dmu63A9JVp6kOiaSRk13wcN8NwEEUQF1x/rUnocxgjwQk8E4DZ9NKs4
	 QUGahIBOR2rMapSOno5DSfXU0V7sTXi8n2OYYVJLmdVc1uvp+HD++mMqZoG9UFEW5KVSn
	 0ci6FYQJDiVkPm4pno2JFbkEJ0+7qlf5M2NJ6ujKOeHjneB5nmyctqaMtlPKnl73llA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="eJ6g3/Nu";
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7F8606A32C
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A7F8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eJ6g3/Nu
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9d52f684fso570425ad.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922480; x=1794527280; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FN4tBVcJFBQsla2n8tME6jrjpUGnwmxW8ysKp7MZ+A=;
        b=eJ6g3/Nu7gOOVimG+lIKWjtolHulWKxAnQHmhueROeXqLeY64GdzJahmcXJyXEmetu
         9sKUPCS9ySmQ/jBc3HF4gEM8OfhqXQuHx3KcNuK5WUVEKtPqt53yOQiCC6FpeKBMJ5yz
         JXxzMg4sBRffGjzpAofr6fLkNCvw2xk6YEl+N2r60KMX70kSoSy54LJHVEdf0UzW/cF9
         ijU8yvfD1yS3uVh+NoYbwnndah/PstbrKVZyR5WP2WNd7ixdulZUbYb+487uklKaNjzQ
         zOiUyPDrHOzDCJKu5Ct4cwTgCRNMb1+oRqHKUa/HYOY9poR/UbuDJ9fw9DL78oFNDoFY
         FrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922480; x=1794527280;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FN4tBVcJFBQsla2n8tME6jrjpUGnwmxW8ysKp7MZ+A=;
        b=nQtD1xAp4s12l5+YFBCRPt5xNQYgZb6RoCyt0qPFHERR/GJeiXMDiRMH8XiC/DsR2W
         dTnjXVTJwzXQMa3fYmEB+lWuBhRswJcf9y6yiqnzVSVBDxg5m+zC58iCHWkQ0TxiKt3E
         T7i6ykF5irCJU+R65e5WkYpGwK4/pZ52p5pJvMEbZSh7rn1mVlNag+tCzgf0/IYAlUVl
         IpubMQzOExMCvoK2adcbSd3Rki9VfcQvPIPwnpVHtDW0i06ZP+qOzn0fp8y4fbU1lHpd
         UeJkC7JS2qDp42b9WSSVuXaJ2f7ICq4z7flGK063uf7c49gRmeoRNsKJu2oBSdSCU6MS
         j9JA==
X-Forwarded-Encrypted: i=1; AKwUvBxKBSlAOLCSQZdBxWgMSEBCgdBDX+NqtJATaKkSiNL+szeIVLMnGVbuT9caJFWW0uVlMC8fV9rIaUHj@lists.linux.dev
X-Gm-Message-State: APuU4Z94j3sRV5UwD6AWuOn9wOpIApeUeXU7QfNpRCIzGyw/NYKY+cXz
	zGet1fbwm44RluGvm1MWzk0iYjYF2Tqqb/8m4pB4N66o7wK/HBYBBC2ImQmS8nNLN9rId/ta1Ao
	0W1AQ1g==
X-Received: from plnu5.prod.google.com ([2002:a17:903:1a45:b0:2e1:326b:da73])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ced0:b0:2e9:6645:e99e
 with SMTP id d9443c01a7336-2ed40c48331mr10886805ad.28.1793922463383; Thu, 05
 Nov 2026 15:47:43 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:55 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=858;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=d6A7oZjd0INte2bacSdXjbStFoBPPx7rvs9xlbLb3u0=; b=9jtIvl+Z+cMjsx274/HuhhAQ0MpGSG0pXW90v5FO8GZuKjRtHljxjeF11lqZ99IZQl8XR/8JE
 EqPOy1Nb/shDDVDDDMoSkur5WKepYwfyJnbEp+GLF3pMlsAKq9tFrTh
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-11-2024e8fa517a@google.com>
Subject: [PATCH v16 11/20] KVM: selftests: Require guest_memfd for TDX VMs
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

Force guest_memfd for TDX VMs.

Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index d42e201eba76..b73a7bfe8531 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -494,7 +494,7 @@ void kvm_set_files_rlimit(u32 nr_vcpus)
 static bool is_guest_memfd_required(struct vm_shape shape)
 {
 #ifdef __x86_64__
-	return shape.type == KVM_X86_SNP_VM;
+	return shape.type == KVM_X86_SNP_VM || shape.type == KVM_X86_TDX_VM;
 #else
 	return false;
 #endif

-- 
2.56.0.455.g6c5a503b38-goog

