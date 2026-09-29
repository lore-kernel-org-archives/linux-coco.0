Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFBE2F8EAC
	for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 04:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654599; cv=none; b=sBhMe8xaHN+ejF9Kb1RZ2C3PKi7wI0AKnZAjW1gniHwCIXxOBj7jKIBwVBRwH52fwuXMI8s0EwLHJObrMRb5bpjZR4nNTf70Tc83m3Uoc0dSB+6Dg7xrS/ibfbwVGOwEooG7CoTs23OtbAaWwwnVCOrr7KimvJL9phC/SQByw6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654599; c=relaxed/simple;
	bh=hwzN7aNlJ2wxS9ZWnQFgLPxc8hv3AZhs4ribMUFVqWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AfMrP/W3lRiKJuquqt1KtLJynLvWVPed0FxhoILWCVBV9OprQQHdhXa9Rf38q1v8DiKcFObhS4uVpEhbGC41yx15Bx9bRT2cv/ORL5SEhEo+ZIZ9/4Dnk5t7mGj/bmp5gBBzEj2haB3KYbuaJT5aQCERSxr4lx/wgoJGXDcUFiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hb5if42i; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hb5if42i"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-869868f45a5so665946b3a.1
        for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 21:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790654597; x=1791259397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wf4+8fPuDTBmj6DTA0OwZVxSovvEfEo3g6LDTXOjhgc=;
        b=mabsSedQGC5sY6l2m4mJBpTlj6UJyFl969cFba7Yk2Z0v3kJYXoKj4nqfFUA5l000W
         vkT2ydW2qVNtZ3IgkVFmeb2YGS0o/gTT8eDXDSDNUIF7cWTAMUGMpYYNXVwVj/UgB8ke
         YEgM5q8U0mKaNxlbN3ZdDp/R6P61U0hfNeBcDUGM/AOIVWDCt5RqIomRiH41TUonukr4
         Ri1aSX6fVIn5NShNE88moxy7URafShzeFveGswsCZQYXebq3tfTp5scp5Qw99O5BgVdC
         KBf9gZrRGWGVveJaRwaj/NGYfISMH0AuBscYE8IwknvspUMXG8Dt4B2JQqzLIomOAjcG
         Ci3g==
X-Forwarded-Encrypted: i=1; AKwUvBwnAFQZ1DgG5czVZQsyiQxOx1TcGv4ncQd8sodcJqj4ADWwExvmvgu46IoPLvbyRpc70b0Qh+9Hir8p@lists.linux.dev
X-Gm-Message-State: AFuF++nK/xq5QVD2YEyoO8SkNrRHNyX0paeSGipeyFK6hBGcVGSoi5GO
	Sn+2KDF592YirZi4XmvaJl6VCawKGoDeiceqis3vwVj5QMnxbGy3tAnBs6pbt/uxyMjy1Nq/i9w
	TM3MDCA3hPEadPWjNnzyrfHgMO52X20LE1p8EG6ypV+M3uJpnrI9XZ4woPVDsVhshLM7YqF9Nnt
	LfUhSQECYtIlFVgG5pCzlabX3u+1MwsveWjgilXScxrh488wh+lrBjlhF6+quvQGMUXQPjRijzD
	0q7xGZtA5ngCw==
X-Gm-Gg: AYBFou2csGQxIUKI5nORoEA/IxB/wDpvDQsyMz2Lc1f28ACRGrLaW5Ynh+gPZmKgQ+Z
	K3VIUsH5yd+dlirwmFANcQZNzG8VilQk4/Yc+o6WKi7jO/+IvfObw79sPHU1Y+NT+0CPQkY9BCy
	klf1fcIhh3xR8SzkHZKEFqKpp7xaxCFMIGQXZZKZtMvdJNHcJfwIWYSlhoP0JifonWSq72jHaaC
	dNFWn/ZjeLRvsrhpDFfnTdjFFykUG0Ig3qBZcl7PEJLpPpzphkXHv0Ar/HfSBMAa5WCY6qxWrD9
	9DFw2iV7nwqr17eIo6KxHILlD6ygGKueoSggPNJRYtPtz2HbG9ArF5mPgqaGzKYjwS8c4xmAaCo
	fV/BS7o/iwHVRUeG0ECPXWf2tC4z58wHqk2jiDr/vGLhHM9XrtAcKqcRmM+WQnsP6svNn6+elFB
	ClnW2rQ8QRyVLo1QunVBzDbzZc7k9l3/5W
X-Received: by 2002:a05:6a20:9c86:b0:3dd:a006:7b38 with SMTP id adf61e73a8af0-3de0e88e3a6mr14007585637.55.1790654597287;
        Mon, 28 Sep 2026 21:03:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc787795663sm7477513a12.8.2026.09.28.21.03.16
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 21:03:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33baaba6371so14196770eec.1
        for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 21:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790654595; x=1791259395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wf4+8fPuDTBmj6DTA0OwZVxSovvEfEo3g6LDTXOjhgc=;
        b=hb5if42iaWOiPcF4FxEtte3eLMPk0UBH+hsierak0oeZ6QEZYKYeMRzkNnVLCxWoOd
         xGT4wMLx7ojckh0ZeKLIZjSPPzhzrGQEPS7J3zxLwKlUuZNEf1IQ8Ws61jQRBUODOIDp
         tMhMIcxFhUVc7AqnVgoKgqU0aVgW9OkntOq7I=
X-Forwarded-Encrypted: i=1; AKwUvBxU2k80vuuJylVKi+m8p8SN7Sb6Rp/qz1twQyc3qVp4OTChdr+6YKbnve8YXkivJ+3tAX8+5jiotsSx@lists.linux.dev
X-Received: by 2002:a05:7300:c8cc:b0:33b:a4dc:d5e1 with SMTP id 5a478bee46e88-3426fbbe36fmr11863790eec.8.1790654595126;
        Mon, 28 Sep 2026 21:03:15 -0700 (PDT)
X-Received: by 2002:a05:7300:c8cc:b0:33b:a4dc:d5e1 with SMTP id 5a478bee46e88-3426fbbe36fmr11863746eec.8.1790654594365;
        Mon, 28 Sep 2026 21:03:14 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347323f5a7esm10952571eec.15.2026.09.28.21.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:03:12 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Kiryl Shutsemau <kas@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bo Gan <bo.gan@broadcom.com>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>
Subject: [PATCH v2 2/6] percpu: Bound decrypted storage for all x86 encrypted guests
Date: Tue, 29 Sep 2026 00:02:51 -0400
Message-ID: <20260929040256.543767-3-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929040256.543767-1-zack.rusin@broadcom.com>
References: <20260929040256.543767-1-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

TDX also needs shared per-CPU buffers. Use X86_MEM_ENCRYPT for their
definition and placement, and provide page-aligned boundaries so the
architecture can convert each CPU's whole section before registration.

Define the boundaries in the SMP template or UP data as appropriate.
Drop the unused DECLARE_PER_CPU_DECRYPTED() macro.

Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Link: https://lore.kernel.org/r/aqqGUAX65s4LdJkr@thinkstation
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 include/asm-generic/vmlinux.lds.h | 12 ++++++++----
 include/linux/percpu-defs.h       |  7 ++-----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 64bc2bfdd2ec..145fcdbbe9db 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -368,11 +368,13 @@
 /*
  * .data section
  */
-#if defined(CONFIG_AMD_MEM_ENCRYPT) && !defined(CONFIG_SMP)
+#if defined(CONFIG_X86_MEM_ENCRYPT) && !defined(CONFIG_SMP)
 #define DATA_DECRYPTED							\
 	. = ALIGN(PAGE_SIZE);						\
+	__start_percpu_decrypted = .;					\
 	*(.data..decrypted)						\
-	. = ALIGN(PAGE_SIZE);
+	. = ALIGN(PAGE_SIZE);						\
+	__end_percpu_decrypted = .;
 #else
 #define DATA_DECRYPTED	*(.data..decrypted)
 #endif
@@ -1022,11 +1024,13 @@
  * Note: We use a separate section so that only this section gets
  * decrypted to avoid exposing more than we wish.
  */
-#ifdef CONFIG_AMD_MEM_ENCRYPT
+#if defined(CONFIG_X86_MEM_ENCRYPT) && defined(CONFIG_SMP)
 #define PERCPU_DECRYPTED_SECTION					\
 	. = ALIGN(PAGE_SIZE);						\
+	__start_percpu_decrypted = .;					\
 	*(.data..percpu..decrypted)					\
-	. = ALIGN(PAGE_SIZE);
+	. = ALIGN(PAGE_SIZE);						\
+	__end_percpu_decrypted = .;
 #else
 #define PERCPU_DECRYPTED_SECTION
 #endif
diff --git a/include/linux/percpu-defs.h b/include/linux/percpu-defs.h
index dbe3267a0a13..fdb666a1b4de 100644
--- a/include/linux/percpu-defs.h
+++ b/include/linux/percpu-defs.h
@@ -169,13 +169,10 @@
 	DEFINE_PER_CPU_SECTION(type, name, "..read_mostly")
 
 /*
- * Declaration/definition used for per-CPU variables that should be accessed
+ * Definition used for built-in per-CPU variables that should be accessed
  * as decrypted when memory encryption is enabled in the guest.
  */
-#ifdef CONFIG_AMD_MEM_ENCRYPT
-#define DECLARE_PER_CPU_DECRYPTED(type, name)				\
-	DECLARE_PER_CPU_SECTION(type, name, "..decrypted")
-
+#ifdef CONFIG_X86_MEM_ENCRYPT
 #define DEFINE_PER_CPU_DECRYPTED(type, name)				\
 	DEFINE_PER_CPU_SECTION(type, name, "..decrypted")
 #else
-- 
2.53.0

