Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC4F284B2F
	for <linux-coco@lists.linux.dev>; Sat,  7 Mar 2026 01:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772845613; cv=none; b=K/nbImMbiISa7x7XUYkOCUYlJb7pelTlR2IOO00NRAikEy8RavrN7P9qRGIt1ZCc5j7SdR590K+HLNSv+DG1Px/MSdoqhV1ofAdyZTVF131M/mVTKudDyDiWb66bg667r43nW1HKgQXgEWscRaNIK88HEuLd0D+IFouUp6ntjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772845613; c=relaxed/simple;
	bh=WqcoyHAfK4LJ4JbVa9jm080V6YhsNdvVNFhOv9s8H8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=frrDaCOc5R/4MWEeb2YFFKPKfOmK1QEkdIO1nC4OFBJ0iqL0c+rC4PQ6Msg4FToMv1/S16SaffG0DxnU8J/BEE8lOiu8UaRvBleN/nk7U/LXcLFTk/rv22rNn8YFW8l+3ajMrjEQhh8zdhXybIDTESD7pIj7Gcwlk9ATdAOf51A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Zl1GlyiQ; arc=none smtp.client-ip=209.85.219.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Zl1GlyiQ"
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-89a018cbbf8so73143116d6.0
        for <linux-coco@lists.linux.dev>; Fri, 06 Mar 2026 17:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772845611; x=1773450411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2kd6mc3vO4n+WElMpRdy7mOjUgRYFPVOH3tEWHzajY=;
        b=gN1+JMJ7Qpd9zeg+LU+39M/k7Sjfjf04QEJz+jbwTjKSSWn9zAsFF1ZaRiaCwvBQIq
         XL+ROqLkLQNUj9DI31c6dgIfWR6U8v11+3nZraHwlJ+aSac2Xm7O8fExi8T6KV45yQGT
         YdVNB/mJYsMgfF6uP2qPttNBaOwplz5tZElN8h5AC9GElQwNqKwS0jGIwqVFxiMD9+VQ
         IQNgknQka7R1Y7s4h35Wk83n+IDEcgjCicJGN7Ps8e4QWPhBFo1QpBVaIbtNI+0jJjFJ
         zhRf224ZQ6qKeeU3XrWYPMOg3cwmhXyMPhnji+WAaYCxrKJj+eYpZFX92e2+ZH/wkg8d
         d7Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUeMn/UEXiLaUBJAINQDejYuuwqBub5sNerZfITT8xgFPM6O2yAbkFoYDsCuXCKK2GdbGIb4Iw6Lnva@lists.linux.dev
X-Gm-Message-State: AOJu0YyelPC81Ioi3SX6URPX/CFV0391NcDfxP42bmese/GWP3sWfUcq
	NY6535ugM71DafYzn0No2l7Ox5J1kOx1SWkgqfPo29I9P6o7TX2UuQYimncgh6vOxhKxEPGGh86
	jplIHNguMNJ+Ls0aO+Ve3gUWjEVP+sMy3UbfgtpZdWwtBXcKnNEolmh16yQiheATzo+Yk9tdBqd
	CnEBvlYld21wXrAqHJSHyqRavg9oCmuMeWSdia1v6hkLBqSsNoI+zaBNbUHv0IfNDLSCksPdriU
	5ZWwKJg+gJDcCgsr2qB
X-Gm-Gg: ATEYQzx18MDD6UbfWLfdSQlVwCA+z8daVBnGvMvJiVaYGkb1jxFq5FBINt1wuPlXnOm
	C63JeRYVvfP2XMMOJqoE7SrllcJjhAjgR+WinEdPmcDEBJKT+bCDmLZXAuQIWRvvOJUJOzhDl28
	FaPIzXlFBxAqp1e+kS531JmMtZvVIJSrp01xlw1DyDJWZLWzNqRzcI6NkR7bZF8iFdC+OR6QdwV
	Q7eBoPQfJ9XJ+ZT+6kfQW66DaCYjhwAO+a6sDqaUMe/igCTCWMJeCnh2a7oFhAzE8eE2sUzSRle
	bDSyJ97MTPV/QZMTqqBsgzz4shsBvLlbgMWpZQXtISAEkSIbTVT7Wxq02HJAltAWzxTza0fUigd
	ZE3ltf0SaS7aQ7tn8cEpc15smckyBog3Sv1QPLlzupkbmpsDmrUOs/K2fRkPmAA0K66yBZA1vZD
	w2LBWi0lLXO+27b4IiQte6SZ+tfs0gxb3pNxCBOn2o0hvPUawpZJW6U4D5TSqIuK8=
X-Received: by 2002:a05:6214:f2b:b0:89a:424:984b with SMTP id 6a1803df08f44-89a24809caemr120844876d6.31.1772845610987;
        Fri, 06 Mar 2026 17:06:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89a316ae246sm3057746d6.26.2026.03.06.17.06.49
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2026 17:06:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdd327d970so4623385eec.1
        for <linux-coco@lists.linux.dev>; Fri, 06 Mar 2026 17:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772845609; x=1773450409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2kd6mc3vO4n+WElMpRdy7mOjUgRYFPVOH3tEWHzajY=;
        b=Zl1GlyiQjXPiouDiWriR2aS9cyEc/lb9ECwDpevmlNc44bEev5LIahXotSozpXuhav
         Byk4ySvu74kceUaw2np3abzawWN2CywRjNsKnnnW8XpFfUVeOCIOxh8H/H8icNRCPMsa
         fHyy/VPg30SmOlQwSFw1zP2UuMHhRPxAHKzWM=
X-Forwarded-Encrypted: i=1; AJvYcCWJ1oJWoPVqn8YMynTyz1xAE/4Ch9wagu65Z+ShNLqvqRD7GtpsbpiY2rDbM4e1kbgUXqbrpdHsMyem@lists.linux.dev
X-Received: by 2002:a05:7300:5711:b0:2b8:68cd:a7b1 with SMTP id 5a478bee46e88-2be3da5e890mr2609666eec.0.1772845608907;
        Fri, 06 Mar 2026 17:06:48 -0800 (PST)
X-Received: by 2002:a05:7300:5711:b0:2b8:68cd:a7b1 with SMTP id 5a478bee46e88-2be3da5e890mr2609656eec.0.1772845608258;
        Fri, 06 Mar 2026 17:06:48 -0800 (PST)
Received: from amakhalov-build-vm.. ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f80cc1dsm2237336eec.3.2026.03.06.17.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 17:06:47 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: x86@kernel.org,
	virtualization@lists.linux.dev,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	mingo@redhat.com,
	tglx@linutronix.de
Cc: ajay.kaher@broadcom.com,
	brennan.lamoreaux@broadcom.com,
	bo.gan@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	linux-coco@lists.linux.dev,
	Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: [PATCH 2/4] x86/vmware: Log kmsg dump on panic
Date: Sat,  7 Mar 2026 00:42:36 +0000
Message-ID: <20260307004238.1181299-3-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260307004238.1181299-1-alexey.makhalov@broadcom.com>
References: <20260307004238.1181299-1-alexey.makhalov@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Improve debugability of VMware Linux guests by dumping
kernel messages during a panic to VM log file (vmware.log).

Co-developed-by: Bo Gan <bo.gan@broadcom.com>
Signed-off-by: Bo Gan <bo.gan@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/include/asm/vmware.h |   1 +
 arch/x86/kernel/cpu/vmware.c  | 132 ++++++++++++++++++++++++++++++++++
 2 files changed, 133 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 6a084e088b30..c23164503e54 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -93,6 +93,7 @@
 #define VMWARE_HYPERVISOR_MAGIC		0x564d5868U
 
 #define VMWARE_CMD_GETVERSION		10
+#define VMWARE_CMD_MESSAGE		30
 #define VMWARE_CMD_GETHZ		45
 #define VMWARE_CMD_GETVCPU_INFO		68
 #define VMWARE_CMD_STEALCLOCK		91
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 93acd3414e37..d9753b1aba58 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -30,6 +30,7 @@
 #include <linux/reboot.h>
 #include <linux/static_call.h>
 #include <linux/sched/cputime.h>
+#include <linux/kmsg_dump.h>
 #include <asm/div64.h>
 #include <asm/x86_init.h>
 #include <asm/hypervisor.h>
@@ -211,6 +212,13 @@ static unsigned long vmware_get_tsc_khz(void)
 	return vmware_tsc_khz;
 }
 
+static void kmsg_dumper_vmware_log(struct kmsg_dumper *dumper,
+				   struct kmsg_dump_detail *detail);
+
+static struct kmsg_dumper kmsg_dumper = {
+	.dump = kmsg_dumper_vmware_log
+};
+
 #ifdef CONFIG_PARAVIRT
 static struct cyc2ns_data vmware_cyc2ns __ro_after_init;
 static bool vmw_sched_clock __initdata = true;
@@ -535,6 +543,8 @@ static void __init vmware_platform_setup(void)
 #endif
 
 	vmware_set_capabilities();
+
+	kmsg_dump_register(&kmsg_dumper);
 }
 
 static u8 __init get_hypercall_mode(void)
@@ -630,3 +640,125 @@ const __initconst struct hypervisor_x86 x86_hyper_vmware = {
 	.runtime.sev_es_hcall_finish	= vmware_sev_es_hcall_finish,
 #endif
 };
+
+#define VMWARE_HB_CMD_MESSAGE	0
+#define MESSAGE_STATUS_SUCCESS	(0x01 << 16)
+#define MESSAGE_STATUS_CPT	(0x10 << 16)
+#define MESSAGE_STATUS_HB	(0x80 << 16)
+
+#define RPCI_PROTOCOL_NUM	0x49435052 /* 'RPCI' */
+#define GUESTMSG_FLAG_COOKIE	0x80000000
+
+#define MESSAGE_TYPE_OPEN	(0 << 16)
+#define MESSAGE_TYPE_SENDSIZE	(1 << 16)
+#define MESSAGE_TYPE_SEND	(2 << 16)
+#define MESSAGE_TYPE_CLOSE	(6 << 16)
+
+struct vmw_msg {
+	u32 id;
+	u32 cookie_high;
+	u32 cookie_low;
+};
+
+static int
+vmware_log_open(struct vmw_msg *msg)
+{
+	u32 info;
+
+	vmware_hypercall6(VMWARE_CMD_MESSAGE | MESSAGE_TYPE_OPEN,
+			  RPCI_PROTOCOL_NUM | GUESTMSG_FLAG_COOKIE,
+			  0, &info, &msg->id, &msg->cookie_high,
+			  &msg->cookie_low);
+
+	if ((info & MESSAGE_STATUS_SUCCESS) == 0)
+		return 1;
+
+	msg->id &= 0xffff0000UL;
+	return 0;
+}
+
+static int
+vmware_log_close(struct vmw_msg *msg)
+{
+	u32 info;
+
+	vmware_hypercall5(VMWARE_CMD_MESSAGE | MESSAGE_TYPE_CLOSE, 0, msg->id,
+			  msg->cookie_high, msg->cookie_low, &info);
+
+	if ((info & MESSAGE_STATUS_SUCCESS) == 0)
+		return 1;
+	return 0;
+}
+
+static int
+vmware_log_send(struct vmw_msg *msg, const char *string)
+{
+	u32 info;
+	u32 len = strlen(string);
+
+retry:
+	vmware_hypercall5(VMWARE_CMD_MESSAGE | MESSAGE_TYPE_SENDSIZE, len,
+			  msg->id, msg->cookie_high, msg->cookie_low, &info);
+
+	if (!(info & MESSAGE_STATUS_SUCCESS))
+		return 1;
+
+	/* HB port can't access encrypted memory. */
+	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT) && (info & MESSAGE_STATUS_HB)) {
+		vmware_hypercall_hb_out(
+			VMWARE_HB_CMD_MESSAGE | MESSAGE_STATUS_SUCCESS,
+			len, msg->id, (uintptr_t) string, msg->cookie_low,
+			msg->cookie_high, &info);
+	} else {
+		do {
+			u32 word;
+			size_t s = min_t(u32, len, sizeof(word));
+
+			memcpy(&word, string, s);
+			len -= s;
+			string += s;
+
+			vmware_hypercall5(VMWARE_CMD_MESSAGE | MESSAGE_TYPE_SEND,
+					  word, msg->id, msg->cookie_high,
+					  msg->cookie_low, &info);
+		} while (len && (info & MESSAGE_STATUS_SUCCESS));
+	}
+
+	if ((info & MESSAGE_STATUS_SUCCESS) == 0) {
+		if (info & MESSAGE_STATUS_CPT)
+			/* A checkpoint occurred. Retry. */
+			goto retry;
+		return 1;
+	}
+	return 0;
+}
+STACK_FRAME_NON_STANDARD(vmware_log_send);
+
+/**
+ * kmsg_dumper_vmware_log - dumps kmsg to vmware.log file on the host
+ */
+static void kmsg_dumper_vmware_log(struct kmsg_dumper *dumper,
+				   struct kmsg_dump_detail *detail)
+{
+	struct vmw_msg msg;
+	struct kmsg_dump_iter iter;
+	static char line[1024];
+	size_t len = 0;
+
+	/* Line prefix to send to VM log file. */
+	line[0] = 'l';
+	line[1] = 'o';
+	line[2] = 'g';
+	line[3] = ' ';
+
+	kmsg_dump_rewind(&iter);
+	while (kmsg_dump_get_line(&iter, true, line + 4, sizeof(line) - 4,
+				  &len)) {
+		line[len + 4] = '\0';
+		if (vmware_log_open(&msg))
+			return;
+		if (vmware_log_send(&msg, line))
+			return;
+		vmware_log_close(&msg);
+	}
+}
-- 
2.43.7

