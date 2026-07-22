Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334D045A2AB
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 23:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762064; cv=none; b=Eu2gYLnXkNhFN3UZyLafYCWfLwSfYnpxNwfgy/mW4yj9JuY/+qNoWm61f0i0+4jVvQJafj0hrCmDAUtRDAALcs85toYfPyE42tLWdTqNUAKBDAzEZWAdmEXZntvY63zYNQDbPURqnNgLvd3WTvBNCkfvazqRbqKBbDWjgCDXayg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762064; c=relaxed/simple;
	bh=V9qPB5Q4LeTwwvk34bhwRSUabO8T9Mew6hfZ0GpdBnk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YTiCYWlTajsguVGbOyuXXmQmilgsXYMqLyI4F9FSZl5h4jOeq9O+bb2/doyoNeH1I+b8AHIoYuaAZd9wMocmXVs6Xm7F951HMv6qmxlCumLk11ByBS5fiJkvUOYorXIfIlP6iwdJIWeva315DQyQXaa2UWC+Dvo0JgY8CXNsDvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TDOXd/Yq; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TDOXd/Yq"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so409565ad.1
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 16:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762061; x=1785366861; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yww/CCbtIflA6zUbBX2detwduDGeaD8MIEWbRdLgMx8=;
        b=TDOXd/YqfRqru3IJf9I4vwVOFh0YLrDHvIE+Db9d9iCj785DAxw/1WsETGB6t+B6d5
         mRftSNxnI1IIDAye3ENBPeko6XyJLMz4lFd1x+oa0r1VyJrXDPgrDOOtGUMUWbTgCMH0
         Tbewbbv7G0lSnEFxM9lIxp2wDNRoqYJShuVSloEhyGI+w2+kuB/QFT7vQ7gW+KBtgnYa
         +yUbcAhMUi7XI59B2rZhZm0/J5sU0ukaJwLNcdZdW4WcwUk31SDgSreIkZxnfeygZ3qA
         7aWb/oZudLKSciWCVDE6dFHncGCqwxwmYJ0HPxg8kUqFGdmKA3H2bKs75wEdvRm6kM7f
         1PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762061; x=1785366861;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yww/CCbtIflA6zUbBX2detwduDGeaD8MIEWbRdLgMx8=;
        b=nxaCpTqmnL3+XJmMsbW2tD4Yf3iU7ljFYfAUCrvdBDybp8HsSbPD5dDpmQ659E5HWp
         TPYaCpiWvUN9uFsb2BsHbWk49yUpcziaY1mdXCiqDDCRkRcPmr5wubgpnraq8vFuNyLZ
         3LlKP2oMHA//btWL8XlhwZ3VTDXnqRUZJT1oVrZKwyRHg8dFTijhMXUCgUAsTHpohpFh
         CkD+leBlg/am1yG/bMSsEuzZ3iYhsd75GbTOxe9hRcF/ne/OZIou285Ie7KMAB/Vptn7
         G1lRKI25+/238pZoBgZZuvXa95BF9kwzRkpjO/CKjU+580Y/ensecdVd7KnNwXJa4em6
         iLYw==
X-Forwarded-Encrypted: i=1; AHgh+Rr68K/SCadMkUYNupUDM8/WcHTtw67D0f9jNhLUqabLEjglt+Fq4wNCFCD2tKrx/jRuifSG+iOh7fb5@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp5lsGsOvNrVvLjZoJikm9QuRzIPfeXDrbBBvq36tLifaPXLQx
	lS99K1vZH0FA29nZVxp9uzBbMeZAtoFq9miVGvknD0YgH//9yhvh4oA3Y72XMZr48Z5FUxDosWK
	oc15Xaw==
X-Received: from plnf15.prod.google.com ([2002:a17:903:1a6f:b0:2ce:9b49:d497])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2282:b0:2c9:c083:cd50
 with SMTP id d9443c01a7336-2cfa6b799eamr10224075ad.17.1784762061199; Wed, 22
 Jul 2026 16:14:21 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:10 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=1838;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=iBqKDnsWg3oJX07267DkscrYgDO1smB3E8LEOAOLwOM=; b=Eoo9zVSr1brvaXAAlLApyWhjCV/awTaposcKMi9eCntr2ggtwIKJiEjKuGir3mLOZ4sBhl9vE
 GprFiY/y/m7BBdR+gvsyOWCgXotCwSuYxjNlbN0yhmUn0oEjnUD3Yhg
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-5-15ad654a50db@google.com>
Subject: [PATCH v14 05/22] KVM: selftests: Expose segment definitions to
 assembly files
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
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Move kernel segment definitions to a separate file which can be included
from assembly files.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 tools/testing/selftests/kvm/include/x86/processor_asm.h | 12 ++++++++++++
 tools/testing/selftests/kvm/lib/x86/processor.c         |  5 +----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor_asm.h b/tools/testing/selftests/kvm/include/x86/processor_asm.h
new file mode 100644
index 000000000000..713b6bc0aeb7
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86/processor_asm.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Used for storing defines used by both c and assembly code.
+ */
+#ifndef SELFTEST_KVM_PROCESSOR_ASM_H
+#define SELFTEST_KVM_PROCESSOR_ASM_H
+
+#define KERNEL_CS	0x8
+#define KERNEL_DS	0x10
+#define KERNEL_TSS	0x18
+
+#endif  /* SELFTEST_KVM_PROCESSOR_ASM_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 7d23344854cc..97acc5aaf7b7 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -8,6 +8,7 @@
 #include "kvm_util.h"
 #include "pmu.h"
 #include "processor.h"
+#include "processor_asm.h"
 #include "smm.h"
 #include "svm_util.h"
 #include "sev.h"
@@ -18,10 +19,6 @@
 #define NUM_INTERRUPTS 256
 #endif
 
-#define KERNEL_CS	0x8
-#define KERNEL_DS	0x10
-#define KERNEL_TSS	0x18
-
 gva_t exception_handlers;
 bool host_cpu_is_amd;
 bool host_cpu_is_intel;

-- 
2.55.0.229.g6434b31f56-goog

