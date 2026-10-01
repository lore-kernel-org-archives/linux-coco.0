Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CEE53447A
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 19:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883536; cv=none; b=KVT5rKt4v86V7OWdNIunDjb+VkvxnV2mF9Q2IO9QL9X8U41j6rQl5UCBqc16EK1UWC1votZVBmIKvhUa+Ho+PllfL65bOrK5jtn2V8KeuM5vWd9gIqOWCOZPbfiUkwCCdoRDT0y28NVXl8vIeF8m0I7/xtMc46LNdZNTUtvKPDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883536; c=relaxed/simple;
	bh=rVoqZdUCo2KLCZ0DuRpcvKXgw+ek6KfWqB9aZuvQsSE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bjyv+9zvrcrP7oVD5ElXleJ2IVc/4X1Lj1g/Fdnx27PYo4Z7lMv7/tNmSuwY8WKmnU9TWcvvYkjbGwkOtudfNdAuGz8DQG9DhzV0OqS1I1XGOTLQTGPSsGRt1bT8pFj4yF/mgxq8ytOjqqQiOseDSLNQ46+58X7dWVUQy6rzSvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=haOzeKfF; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="haOzeKfF"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so6744862a91.1
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 12:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883533; x=1791488333; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9nVGqEblihe3RvMwmuzVW7+thHX4Pda1dDAZe/9upo=;
        b=haOzeKfFZ5Of8LXKdNYVvaRL2TSFbShfHHyff50pZtOCqGGTnurLS36TiESXtYX7A9
         FynL75BeH7Z00OO6DJ5i4B7JCGiOvMuIGoPJTkrQWy0bMiQObqpLIVL9pPk4xWuT2Ec4
         Zp7rJqAAbsdnl9SMYSGkp/1YxtPe5M/zPEyosrSuuYxg9qpbAl0Fe7bgoxYoejTgUdmp
         YF4LoOSJGg3/6jQWQ3+htrJ/MqKTbapQkOIr+S0UWtNWDJdjwK0bc9e8dvkotQpMVVhC
         6QogqMuc5nm11hPFQDoP+CmpyeARhyOVjIgpZHHbD/A07d637/Dq+Yf8IQ0cfG4dJPof
         8okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883533; x=1791488333;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9nVGqEblihe3RvMwmuzVW7+thHX4Pda1dDAZe/9upo=;
        b=XWPXDLHfLbl2pm/f1hcY1prEi7fSHzuv2XDbVyu8tZKpQA9Nl+U3M3ijObWnXT8hcS
         iImgJJL9QJvW+vsszaa1/Xnd5Z1Dt6bwJZBsGUslp6TREba+haBxJ/raB1WmhVo41jMQ
         a6vg2Uvgo6R7/pVvFrV/vZh07soU1qCYdjyOHPkGFIMYljjuGPpEASVs228YtcFJxVyb
         seRD7ZkxhS51TQv4s+yJsuVAQoHx9Z+3ekAg/GmcdXDGQZf7Grne8ulaJuXQWSTUqrMZ
         CaeeLPR/noQQUhk/0+mKOT5s36p+pIaN21ZHD1drYEXgQQDwMVFrGWtbpKGzWeOiHhmz
         Ejew==
X-Forwarded-Encrypted: i=1; AKwUvByzVYoUqwUu8MOdbmfSRWNAujs/UFzBqYiByxDJbkiQ7qzc32byamkGHyFvrBiMd/XLWG/oVEBeaJJV@lists.linux.dev
X-Gm-Message-State: AFq9FYJBDLs4J6a8YtQ7zj19Zebgs5X0I6H8f0/XxiYtx6mUM8Slayv8
	LncarY5D9+vNpd0cGamYIX7+xAi5163NZjQ6seclRCplizy6b276J9dwX/kE+mAysei7el3Cgsy
	FK4TNBQ==
X-Received: from pjbkr14.prod.google.com ([2002:a17:90b:490e:b0:3a0:ab35:7895])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c06:b0:3a4:a2f9:f2f9
 with SMTP id 98e67ed59e1d1-3a6cec2c079mr518533a91.52.1790883532437; Thu, 01
 Oct 2026 12:38:52 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:39 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=814;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=rVoqZdUCo2KLCZ0DuRpcvKXgw+ek6KfWqB9aZuvQsSE=; b=XlRY7AWBOUyhMCsHhrBnJ4ws7Y0Oy7c2izI2AnJ10Jo7DjZMksQQ6ELZsUa5n5xjQUGWTnd0d
 3EVQL/48+8ZD8BDU8W1EV39wxfLZIL3YsuulJzqoEdiwJIcfVgEqUJi
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-12-7c62a5d8a992@google.com>
Subject: [PATCH v15 12/23] KVM: selftests: Require guest_memfd for TDX VMs
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
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 3f559f207408..7625908caf21 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -482,7 +482,7 @@ void kvm_set_files_rlimit(u32 nr_vcpus)
 static bool is_guest_memfd_required(struct vm_shape shape)
 {
 #ifdef __x86_64__
-	return shape.type == KVM_X86_SNP_VM;
+	return shape.type == KVM_X86_SNP_VM || shape.type == KVM_X86_TDX_VM;
 #else
 	return false;
 #endif

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

