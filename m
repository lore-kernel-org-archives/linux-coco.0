Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981CB2882D2
	for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248125; cv=none; b=PNCLRSwNtgzEZTM+BT83GymQXiZ8vUicq2ameRjmeUKt1iL8j2jU9nEHq+VNiQpHh7a7JJ3JcCOZF9vSNfbyT2tRu6+PTHV3tnGRDN4Mib6E/6NBAdxfrj0vF5RR1HQn3Ky8Nucwn4HQ4oGXNV9YI5qmJJmOH46b74HlF5r+jVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248125; c=relaxed/simple;
	bh=8WPS6fJFn9ZOxrssZfprQKVrhRW5a0xtdjp+RK/angE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nOT4qTtSzfGchsCMlCEWL8IaoxsPc9R2kClfAvxrCS96Sj9dxzwm2dC1X2P9WkEQnaybQxNa5aN53EiEhGYqJk3NnaGPbER5dnOxbj/jKrO6N5kq7ljV7dV9TNoHmknZEbHVhqOYp47ImUOiat9AeeuRkTX7Y0geaoH3la0b08w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tkPZSDWc; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tkPZSDWc"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30aab0f21a3so159674a91.3
        for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 11:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747248123; x=1747852923; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CYJuHf6JfZCBn/xacOL2tI46jqMW4+1r9XjhA6jdQBY=;
        b=tkPZSDWcTHdHZpdvFXzFea+eFkGGassQ1BKU+PImZnQnvMlOxO5mr74n4mctiQScXE
         L7/PeAQCUIczWEGouZ2Gabn0ZVUTtQ3JPRvY2iQ8yE7Si+6wMypoZghUQaX4Gu7g94vV
         rZWAiwZ9wZZbmn9pkcmrSKolAEe9aHkTyiBA1HE7J+E5+06MEnwEzshQcztXN8c2md88
         oidCxi380ENfxH5/qpK/V0+zJ3Y1dAHdMvWn8BFlGATUXna3aW0UZEnOp0WJbxvDWEfS
         cYNtd6dK9EKPRVcWyucN9ciUfqqdH8280EDtJBVwmoq4nkPrUzsleA+/wYB/2CiQqq3D
         1c1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248123; x=1747852923;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYJuHf6JfZCBn/xacOL2tI46jqMW4+1r9XjhA6jdQBY=;
        b=jbiySWvCdih6JnotjUtNy0czBV0rh5TDz4w226P4mu+0mYMuuH2rWfCSWsgsV/9Vxa
         d9XKmd4SPytwIgOjCfv+NLjLsoY/FKku+8WzxLPxvG0A5o9mbbeoxqzWZRvriGYq5Roi
         MeJn1z6I7fu5cH/CArz/nFzGB0yvtOHoBYYfP7/93DpeVvF4Ji5rEr6PZxJfegnAydLE
         4uWwF9A4ftVPLWiJZqt1IhOU0CKhuBXxTIbyAhgyiRpgL/zb2RB5Nne78HITVrUjDgxw
         odu6Z/loyrLWSlpSqjU+uxO8Rk3QtRFjm/HC6FwvOMhtWDgsYBQkeWBfnKy2q7FTb1KE
         QOXA==
X-Forwarded-Encrypted: i=1; AJvYcCUZjs4l5C69CrgEOHipkmDBClHpfrEeroFNJuJxja28rH6pTREnS6wxDVgGjcaHnLAo0kkvL+8lpAXu@lists.linux.dev
X-Gm-Message-State: AOJu0YyPmgNM/Dv/Lhclwo12VtAiwWwyxmBGXmnOQy1EX+hCHpmZZL8l
	V+fFXV/wNw4/efQHXtyC+ER53aJ0vnk8KE1UBlO+Rs6Ndi4+FicfgVDOvCymnxK5xjfoLI0oIX4
	0HMDC/ydlzbLLLeqtZ3CNsg==
X-Google-Smtp-Source: AGHT+IHaW0tGNG2An47wn7ypYPKbD5kAKXhci3mLdyKHvLgmgeV/RB/EAKA0ZnHx69e5p2D6/yHVAiXZ18yI4rGUsg==
X-Received: from pfks12.prod.google.com ([2002:a05:6a00:194c:b0:740:6f6:7346])
 (user=dionnaglaze job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6d88:b0:1f5:5ca4:2744 with SMTP id adf61e73a8af0-215ff0d4647mr5637627637.17.1747248122860;
 Wed, 14 May 2025 11:42:02 -0700 (PDT)
Date: Wed, 14 May 2025 18:41:36 +0000
In-Reply-To: <20250514184136.238446-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250514184136.238446-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250514184136.238446-4-dionnaglaze@google.com>
Subject: [PATCH v4 2/2] The ccp driver can be overloaded even with guest
 request rate limits. The return value of -EBUSY means that there is no
 firmware error to report back to user space, so the guest VM would see this
 as exitinfo2 = 0. The false success can trick the guest to update its message
 sequence number when it shouldn't have.
From: Dionna Glaze <dionnaglaze@google.com>
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Dionna Glaze <dionnaglaze@google.com>, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, 
	Borislav Petkov <bp@alien8.de>, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Instead, when ccp returns -EBUSY, that is reported to userspace as the
throttling return value.

Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Joerg Roedel <jroedel@suse.de>
Cc: Peter Gonda <pgonda@google.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Sean Christopherson <seanjc@google.com>

Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
---
 arch/x86/kvm/svm/sev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index ddbfdce9dc18..5901a7f59f88 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4065,6 +4065,11 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
 	 * the PSP is dead and commands are timing out.
 	 */
 	ret = sev_issue_cmd(kvm, SEV_CMD_SNP_GUEST_REQUEST, &data, &fw_err);
+	if (ret == -EBUSY) {
+		svm_vmgexit_no_action(svm, SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_BUSY, fw_err));
+		ret = 1;
+		goto out_unlock;
+	}
 	if (ret && !fw_err)
 		goto out_unlock;
 
-- 
2.49.0.1045.g170613ef41-goog

