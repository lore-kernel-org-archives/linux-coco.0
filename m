Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A63352FE23
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 19:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883529; cv=none; b=hbtJIDrppn93OWrB7+WnUf/U+6zfVbWjzrc0+/qiNDrS3sqFCzko0UAWVtvbJgII9wGamO/Vz15pqM66jbOJw2GvYVB09gmkvOEQYH76zDoaWCWWVKHfkVR8Gc6FM4uqcLsdfNpjERj2QDKdKsBUs7NSvIgAWvNHPz7Q9i//llQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883529; c=relaxed/simple;
	bh=MrSXmZdvpiE1/bEayuyU4c5ocMTn0Rj/1+38q0B0xHk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JFOw4YoMpd49Ukr35sj84vgLksqrHdYPJ1J4ZfU9MnAirsDffaksF+/8OTxPqTqMcvQUDQ8QnGYWNvBvQ7BhzIhTc5tt/wm+53Riu9aBP//EqvyANfOXpUZTi1x0yIlKe3bzvGRruHUQOsTv2I0aUE1dPb+blRlofE9JHc8t+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VimKJS7d; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VimKJS7d"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso4818006a12.1
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 12:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883527; x=1791488327; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABZ938N+BwrUnvWzaQZFv/PCXSFM2iXLE7WCZ3ELhKQ=;
        b=VimKJS7d6DlStqXQx3BCnNF2VxctZC+H9Ahm+ZH/Mnc7RXUtTUsACSTPpQUPp6sLIZ
         sQVX/DmohYbNsK6mAJkrhUS9hAaUJJfpaNBjUouF6iZ/oCi8DwABlF0d7gpDECuEUGgY
         W0bpc2ZxCMmc4gsem0U6231dgbIOP9EZt35PoCNo6vSgXHUY19fmTF0fv13RC+16uRBr
         grjHeCk+Ep9zgm/zeq/OpYEnMq3AIlh3w1QZNDkh6rSWPfpw8/Vm7JeCXwW/QcUEOrLK
         9pG4xP/G6Tb5PiHWdQBMXs61vdILkvfJjg/Phr0/ubp0MfTapdInUNROxMpEof1euGki
         drDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883527; x=1791488327;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABZ938N+BwrUnvWzaQZFv/PCXSFM2iXLE7WCZ3ELhKQ=;
        b=vynoFhfLSP+mq6P7egDfvJ+p8ySDrVmsKC6npr07hZE81dHlXN0QL0RBsi417uzofS
         zWK4zwaFvydlePtRvBaxsq4icRwqHi3KSvX1T8jeom+9PcTzGSav+JLQS65JrksuaCw4
         OVQxT4F260TCoRPy74+fDTBHhuYSr4GIuhNSzeB37YIY8fv69tno4foe2CMWcqvV3xNK
         CvmzSTXC5O5VnIPe80L9ay+EiBCFe0HdPxpNBsfH+ynyk7usGusssPpqJVSaEt3UYP+u
         pAO4B/7LT0O/opeVHyU2arvbC5G/UneWWg/rxnYZXhbktYOMkLkwyMwZBSkPeVIKJvBM
         0m3A==
X-Forwarded-Encrypted: i=1; AKwUvBx2TCpMWukTt6ZKihpTqwbwV2OnUX5emuN4+s2hNpVQmoIpZoxMG8pVJD5KjyQkLfPaDojNBl1KB4co@lists.linux.dev
X-Gm-Message-State: AFq9FYLStCCMzZt9WPmOGXSq/6W5q0IpjTJr+Z7M7qPL48b3pVXDvqep
	tqFs12uawN7qanv9Q2Y/p0o+sTAjVGMm2ecKY6U508YtKvSkYmuDCehmycOWwihqEWjK4qZv9Ku
	FgWZxKg==
X-Received: from plbd9.prod.google.com ([2002:a17:902:f149:b0:2e1:3498:c5bc])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:10c9:b0:3a6:dc51:ccec
 with SMTP id 98e67ed59e1d1-3a6dc51ce9cmr39607a91.67.1790883526427; Thu, 01
 Oct 2026 12:38:46 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:32 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=1611;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=nNPUtDDLL8ioadnHxWtAymAR4QeiExPI2Y33kr7rHIw=; b=h3xyWEzTeW0OqM2GHeGD3sihd2wfH9g0E9TgHGNRTcf18fvUVdzrRa5sWq90CdT/2ZU9M/A+0
 PQKQ1H1zjJpAooa/zRIzljVS+/PEkO55W1ALx5HMccRPnttGr6R9xe5
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-5-7c62a5d8a992@google.com>
Subject: [PATCH v15 05/23] tools: include: Add kbuild.h for assembly structure offsets
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
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Add the Kbuild macros needed to enable the filechk_offsets mechanism to
generate C header files containing structure member offset information.

Tools depending on assembly code that operate on structures have to
hardcode the offsets of structure members. The Kbuild infrastructure
can instead generate C header files with these offsets automatically,
allowing them to be included in assembly code as symbolic constants.

For example, the TDX guest boot code requires access to parameters
passed in the C structure (struct td_boot_parameters). This header
provides the macros needed to extract these offsets from C code and
expose them to assembly, ensuring the two remain synchronized.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/include/linux/kbuild.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/include/linux/kbuild.h b/tools/include/linux/kbuild.h
new file mode 100644
index 000000000000..957fd55cd159
--- /dev/null
+++ b/tools/include/linux/kbuild.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __TOOLS_LINUX_KBUILD_H
+#define __TOOLS_LINUX_KBUILD_H
+
+#define DEFINE(sym, val) \
+	asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
+
+#define OFFSET(sym, str, mem) \
+	DEFINE(sym, __builtin_offsetof(struct str, mem))
+
+#endif /* __TOOLS_LINUX_KBUILD_H */

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

