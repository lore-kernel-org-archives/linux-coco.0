Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE3C365A13
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 23:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405448; cv=none; b=jg7SdnG6Zdh56yCiqZIoJtYJWqoJ3B+BMZRbvHlxnOYdtqWRYMQ0cIgvO1QypghkOWoB4GVj/b3deioUYVTa533gbX+1IrvbLyeuGOZNXOqUlJysEyJ70StjJoQuMa6fPo/xwn8n5aDwEU2ndgfaMaT3KLxAbD7f+5wYVY3MNxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405448; c=relaxed/simple;
	bh=/ikqpmqE+DNbwk8ZasaSPnLDlqFFZVhzhj9NNBVLUKo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=onTInnjTjO0dn632pr1yogzO/fXSrxFszpQEH95AA6pw0YOozob1ihun75SeV+NmmS+1rkfI3jDEhXdKOl7FtqbwxuJ5tjI5FzFws95LAY8C4pQptJ1fipqjogwJC7EeXzZ1RU7saqVyoeBnWnFUGlGlUKpwz5cT0AFoNiJULjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aFL/I+/u; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aFL/I+/u"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ba718173d1so114726235ad.0
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 16:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405445; x=1780010245; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kfsTBh74zO/72fegZAfmLQ14a37FMIV7nJgHfXozZ0I=;
        b=aFL/I+/udybkfqHkZt7c0ySiMauINQsST+ycUFZZndbx5R4dO7YINshBVVZQksi7PN
         1swlzAmEVISYSNMZaGlP8skFqseaiWGLemtOZwcKUawrUqi1K8tVSFC++aYuIpaA0Ci4
         gN2RoTJXYf5VvsVj9FJ9VMB1Y2Pc2Hwa57yi7UdL829j5z1HoZTwHShq/HL69uiuzv+f
         U1iiJ27nilBMW/0SnalY0eedeFuq0PI5rMFtfDrkGXiFTN+ScUzBh/kgZ+7cidNYEqh+
         oJ0FUIHvpCQzk52C6/k2+SgOSPbiqCFJxiNBO9PVb9gg0/Kx8gVKP7BS483QvGRrTz6M
         8sDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405445; x=1780010245;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kfsTBh74zO/72fegZAfmLQ14a37FMIV7nJgHfXozZ0I=;
        b=glCehflmH83Ch82iIkvqr4DRriSZmgRRhWVkvwM6E40IZ/ZN3O/sC8ah0cIiGgiwkX
         ybGOOcEmzeDi2Lp637qVHU/PST2Vjbh60hzDk+4CjMYBK6KNhUMOjc+7mx30vRPfP0Hy
         0XwA+I/uvu7efluRBi77wfcK4MGTyZYXXBVw1hO3w8MFE+RaVjfAd9piHkMXQz2MA852
         H/YPEt6l/mQSG3lUy+/tkiugjIXBKoYP/Pso0mgapZscq6mLDaebhVKwTqzEaUXqbGa9
         RQZVFQnFNpQ9To+ybH6daVTFy3xnwWzQqIhyK9oNTRAqAi8k5Qp3ctt7FIfW7il8mfAj
         gw5w==
X-Forwarded-Encrypted: i=1; AFNElJ/yUp0zqsqU5d+OLHbyL6m3y6evhxqK5J4F7vP1QMPlqcikhhrxn/BfvNGYoeqky1kbAU5DaQCCD/OZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyFBhAJliKwIvAnyvl1u9TWN+5DYthSoE0ap5fGyrkNzgBX3i97
	SfiDDRfBAxvHSIvdvtxaWi7OPJlFF4LcC0xbpDaUaJBJDd2sx/pscnFrzhJ/HkIuJ1ZQ3gNIZUP
	Yigi1wQ==
X-Received: from plfn12.prod.google.com ([2002:a17:902:e54c:b0:2bd:2711:a0d3])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3b8b:b0:2b4:63c8:ce18
 with SMTP id d9443c01a7336-2beb05a4cd9mr9918675ad.12.1779405444904; Thu, 21
 May 2026 16:17:24 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:45 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=1755;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=/MQdgEc/h7i+uzxsvqrPX6CKbZfIx+FZ7QuCfWgiUcM=; b=zYqPKl+0PgIvqPdDBBtRymGcofvU8gAR4TrOXAPOM8BmRvbWUfMGwj0bzxV7hqNZ548vHmcsB
 dh012449LQTBUi2V/D6kMZO8+C0pOlo7VqJm5OW7mceFC2nAQeLc5VE
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-4-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 04/22] KVM: selftests: TDX: Use KVM_TDX_CAPABILITIES to
 validate TDs' attribute configuration
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Isaku Yamahata <isaku.yamahata@intel.com>

Make sure that all the attributes enabled by the test are reported as
supported by both the TDX module and KVM. KVM filters out the attributes
not supported by itself.

This also exercises the KVM_TDX_CAPABILITIES ioctl.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 868ff62e22f2..e5c998874a0d 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -110,6 +110,18 @@ static void tdx_filter_cpuid(struct kvm_vm *vm,
 	free(tdx_cap);
 }
 
+static void tdx_check_attributes(struct kvm_vm *vm, u64 attributes)
+{
+	struct kvm_tdx_capabilities *tdx_cap;
+
+	tdx_cap = tdx_read_capabilities(vm);
+
+	/* Make sure all the attributes are reported as supported */
+	TEST_ASSERT_EQ(attributes & tdx_cap->supported_attrs, attributes);
+
+	free(tdx_cap);
+}
+
 void tdx_init_vm(struct kvm_vm *vm, u64 attributes)
 {
 	struct kvm_tdx_init_vm *init_vm;
@@ -129,6 +141,8 @@ void tdx_init_vm(struct kvm_vm *vm, u64 attributes)
 	memcpy(&init_vm->cpuid, cpuid, kvm_cpuid2_size(cpuid->nent));
 	free(cpuid);
 
+	tdx_check_attributes(vm, attributes);
+
 	init_vm->attributes = attributes;
 
 	tdx_vm_ioctl(vm, KVM_TDX_INIT_VM, 0, init_vm);

-- 
2.54.0.746.g67dd491aae-goog

