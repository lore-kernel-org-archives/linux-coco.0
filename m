Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A725B155747
	for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 00:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727099; cv=none; b=rwtLahpFfAVui1u4JDFqNc2d8A6AF9RXeBAaIDPzBTnXXL4fq5XxMydhKR367N987ZRDaB7x745vA6DqSe7PbwC0KaZDcwSO5xp32YhJE4es/nlMAojkoytEg4KqFae2Y6IEg6NAfBmMIab0BpBuB/fNE53N67qZUjef+KivVDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727099; c=relaxed/simple;
	bh=A7IRWuPMCa9/K6ayW7GZntUsPEZAJO7D1Iq8/qQOpAw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TSpca4IWrixNNck8o231CMykkmAV7rRk8dKbgH/efHLcqdRpmphVcVgYRN60MLqqtIHwk4BGIY+OUgPjcON3XRKfR+cl3T7XH9wrQzC+tCcsbEXur37z/c4tqalolFZVLc+EAVLSxQNgkI0mGzOuWpN0vF4bzqZ9r6Nbvp1r2Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GjoP8yK0; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GjoP8yK0"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b6416441eso8180057a91.1
        for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 17:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790727098; x=1791331898; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jH3B8GV0tS9VtL5MIP+jFUJJXxCC4SF+dpbD+h0RZUM=;
        b=GjoP8yK0jNFcILXTz9/bxtEfsj98BfxEoEuQvaAtkEUlfVn1cKN1tfQw09QJSrZrGD
         aJULTzYk+CU4yclnleH9HC8+KEhfyxeyNiZDU2jMwAWSqoAmoOVXDKOda/FxgP6eT8eE
         28PHrjm0sfLCWmc8yWgAJDTL+bQX/8cZOkJqNfAi4UYXyLFAtVV83oFGnxmjEOwclCQC
         uTcLe3bunKfk7ttQq0iTzldm3LftXm4pJgVKhhIrhvqHv3MEjqLd4IviehrGpSGElJoe
         0abR5wLmFQ9Nfpe0GyjCH9pnPdiJ2oj1gpguiP8RvVS6qG5n5LCZzYnabmZhxHF+p3Ms
         TDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727098; x=1791331898;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jH3B8GV0tS9VtL5MIP+jFUJJXxCC4SF+dpbD+h0RZUM=;
        b=zalFR1vV+2QIXPHVJiVovFPIaNZ5vzM9fniVpyi1jtIxlGxcZOMih45y8QbOeZCkgs
         PSDlJD7gjyspT/kxW9fKEYGKwHuCr4BkodGya/Drtp38zECFtxTU//FJG01AN1U4fh+N
         huaZF3OCh7nS+KS7X1A1BUpuBXhF/ifthNkdudRk3a2C5676USEo+QWpTW5S6VMLr7Da
         fghSL9DyU47+rx1Nbxh/Wja3vl1KvxXCcVGMnLGPOl26tBvmyrbJTtWgohW86/vCXF2p
         ZAaDWC9ksA1eAZNM3NKY9HTeiYSfkV9GC3S80/Qxq33BNqDinMPJpLfpEI/I+LcrLQmG
         +j2g==
X-Forwarded-Encrypted: i=1; AKwUvBzndVbYJM6MyfBaq+lymnCMO8lb7SE0omb7Aq1p8Ep+Is0AMON5X/hRfZn6wFa/iC3Q9zJQQQMNIlMU@lists.linux.dev
X-Gm-Message-State: AFq9FYLvXX7h7GW79R6MIZ3pZnPJlTHHmUhoe8t0HlsIqtezxTUKMsjQ
	CHO/mtDIHWwCj717PGrEP/irufiX/o9DALjCsY651X5IdjCzAmyue4XVTGyn3ZGcrfAtS08ozSW
	4r2nixg==
X-Received: from pgdu24.prod.google.com ([2002:a05:6a02:2f58:b0:cc7:d188:3fa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:ec8e:b0:3a4:ba95:5731
 with SMTP id 98e67ed59e1d1-3a4bfe553d6mr786254a91.36.1790727093138; Tue, 29
 Sep 2026 17:11:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 17:11:27 -0700
In-Reply-To: <20260930001127.3170009-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260930001127.3170009-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930001127.3170009-4-seanjc@google.com>
Subject: [PATCH v2 3/3] KVM: TDX: Ratelimit the "EPT Violation on pending
 acceptance page" warning
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Ratelimit TDX's kernel logging when a guest accesses an unaccepted page and
has opted to disable EPT Violation #VEs for unaccepted accesses, as the
pr_warn() is trivial for a misbehaving userspace to trigger.

Fixes: e6a85781f783 ("KVM: TDX: Detect unexpected SEPT violations due to pending SPTEs")
Cc: stable@vger.kernel.org
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260923164348.2DB2D1F000FF@smtp.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index e3723f1222fc..4cac43299851 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1937,8 +1937,8 @@ static int tdx_handle_ept_violation(struct kvm_vcpu *vcpu)
 
 	if (vt_is_tdx_private_gpa(vcpu->kvm, gpa)) {
 		if (tdx_is_sept_violation_unexpected_pending(vcpu)) {
-			pr_warn("Guest access before accepting 0x%llx on vCPU %d\n",
-				gpa, vcpu->vcpu_id);
+			pr_warn_ratelimited("Guest access before accepting 0x%llx on vCPU %d\n",
+					    gpa, vcpu->vcpu_id);
 			kvm_prepare_shutdown_exit(vcpu);
 			return 0;
 		}
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

