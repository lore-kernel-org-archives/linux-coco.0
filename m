Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6E0482CD
	for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173788; cv=none; b=M2kXSyH1n8DB39J/gVmYPy0sPb2r74DcoEQxJ5LgB6Stp9Ks3FAEGQ3lEjqFjvBkbxGTBrXsFwEO5bG2fhtI9b2z5TUX92FwtqQqb6voDJKYKXjBIVh3H4uq/x8HFvLxwn6MC5JkKqZtr2L1QZo0Z/Va258LmaElgiKEbquHFGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173788; c=relaxed/simple;
	bh=u41R1/z/aMOcSfYC5FfDMYjUC+WpOX9ZGT07yO69ORc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=GAV6Z/+t3sGvfPBW6eJbVj7mkeRacM33a2LovvJ52WzqBnEb2yAOQSiAD7eQKj+gbr+qmkWEw9iXfK6WZbg00hrPDmejnb9S4iRZPAVxJ0EzumBCxGoVkENICeEfM7ftb2OFSyiloQkT6HEsnD9kXAHaumRtBNB1kULBvOqU5PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPF1AL70; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPF1AL70"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e64997a934so3542770b3a.0
        for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 09:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710173784; x=1710778584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/AMRNASf24/etkhelqi2/rcH+v+7JaskxvtUiwcImk8=;
        b=LPF1AL70U1yvgGpk0kRhfIta6Kz5PKNlVXZvSobtvvSlzujsooXnIx3FvLyJBGWoFD
         zjKqe2psYiDwuvlHhEYBbpLOAaaimF/8ZuBG/0zHoR8u+swO9zSeIubecE9hTfe3lE/V
         HgKa2G927ZdMJnRI6OOUWDdU8d2uM5R8oEt2UUxurgF66KUGH3YI3jLL3o8Drt3tU4vf
         kMmGVmbuMRJq8xvrqDGIMlqbbOf8J/uS8u042Ma2E7HctLpTct0pIa2CENXtqEF4bhlu
         8UYJnl+1dOGoKsAhsIgyA5l4rlI9GwAQguJG/a5eu7XfVCMoPUHyMnDEu8ceKprS2azJ
         WYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173784; x=1710778584;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AMRNASf24/etkhelqi2/rcH+v+7JaskxvtUiwcImk8=;
        b=UTGMfNFcbWeAeChtpMikQ0QaQnS19Ti/EUPWWG4u/fB6jbQp+jPpuyeHuZz/q6X5ff
         mvbHmZi4jqnY4DKWENSb/yJLsQqcL7s2YRruoJfYIlszC+J3JNqoUOSbrjWw8kVGi0LX
         00c514E6wmerI4xTwVsdwaoxONi23UHV6W+jOOeORy814hGSPGDL4W5G3BFFcw0sV4T3
         dQ6aXI2BrNPeZbza3ejpVG2LuzbvQTbDEN7qj6Dtl6Q4IAorSuEWvA1NWOnZ/gMziqjs
         LUschpYvQ/lDwsnkA70/H8ZPBjQoGugb4773haTQ5DM7WZO4k3CjWN+WVcYvEnFgiJsQ
         IOqw==
X-Forwarded-Encrypted: i=1; AJvYcCWnoVKdjhcOfErWSkPAR1vo8pibZEvE11Jqp7lQCRna6XLB723thxtO6Y61ct27dw8+Qr44jGJCV7uwnvHgnX47+Vug/+TuyF8Qnw==
X-Gm-Message-State: AOJu0YyL9skYWcjN48lDyt96uEWyJUmzfIpO11jjxTpBwEyGQ+Yx2zce
	7WJjECUndE+WMb0I8XfPE1aj10zPo+q81QuPaVcyTUtUkjjKWPNN
X-Google-Smtp-Source: AGHT+IE8Qf0qy9YfHTX5yZH+MvkpBowKO2nlgBRR4/DNOeI2LZr0IiapRKmZUPnBWkeXc9ZQ9NbneQ==
X-Received: by 2002:a05:6a20:d387:b0:1a2:f4fd:b1cb with SMTP id iq7-20020a056a20d38700b001a2f4fdb1cbmr1033665pzb.55.1710173784131;
        Mon, 11 Mar 2024 09:16:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net. [73.254.87.52])
        by smtp.gmail.com with ESMTPSA id m22-20020a056a00081600b006e52ce4ee2fsm4576325pfk.20.2024.03.11.09.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:16:23 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: rick.p.edgecombe@intel.com,
	kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	gregkh@linuxfoundation.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	kirill.shutemov@linux.intel.com,
	dave.hansen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: sathyanarayanan.kuppuswamy@linux.intel.com,
	elena.reshetova@intel.com
Subject: [PATCH 0/5] Handle set_memory_XXcrypted() errors in Hyper-V
Date: Mon, 11 Mar 2024 09:15:53 -0700
Message-Id: <20240311161558.1310-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Michael Kelley <mhklinux@outlook.com>

Shared (decrypted) pages should never be returned to the page allocator,
lest future usage of the pages store data that should not be exposed to
the host. They may also cause the guest to crash if the page is used in
a way disallowed by HW (i.e. for executable code or as a page table).

Normally set_memory() call failures are rare. But in CoCo VMs
set_memory_XXcrypted() may involve calls to the untrusted host, and an
attacker could fail these calls such that:
 1. set_memory_encrypted() returns an error and leaves the pages fully
    shared.
 2. set_memory_decrypted() returns an error, but the pages are actually
    full converted to shared.

This means that patterns like the below can cause problems:
void *addr = alloc();
int fail = set_memory_decrypted(addr, 1);
if (fail)
	free_pages(addr, 0);

And:
void *addr = alloc();
int fail = set_memory_decrypted(addr, 1);
if (fail) {
	set_memory_encrypted(addr, 1);
	free_pages(addr, 0);
}

Unfortunately these patterns appear in the kernel. And what the
set_memory() callers should do in this situation is not clear either. They
shouldn’t use them as shared because something clearly went wrong, but
they also need to fully reset the pages to private to free them. But, the
kernel needs the host's help to do this and the host is already being
uncooperative around the needed operations. So this isn't guaranteed to
succeed and the caller is kind of stuck with unusable pages.

The only choice is to panic or leak the pages. The kernel tries not to
panic if at all possible, so just leak the pages at the call sites.
Separately there is a patch[1] to warn if the guest detects strange host
behavior around this. It is stalled, so in the mean time I’m proceeding
with fixing the callers to leak the pages. No additional warnings are
added, because the plan is to warn in a single place in x86 set_memory()
code.

This series fixes the cases in the Hyper-V code.

This is the non-RFC/RFT version of Rick Edgecombe's previous series.[2]
Rick asked me to do this version based on my comments and the testing
I did. I've tested most of the error paths by hacking
set_memory_encrypted() to fail, and observing /proc/vmallocinfo and
/proc/buddyinfo to confirm that the memory is leaked as expected
instead of freed.

Changes in this version:
* Expanded commit message references to "TDX" to be "CoCo VMs" since
  set_memory_encrypted() could fail in other configurations, such as
  Hyper-V CoCo guests running with a paravisor on SEV-SNP processors.
* Changed "Subject:" prefixes to match historical practice in Hyper-V
  related source files
* Patch 1: Added handling of set_memory_decrypted() failure
* Patch 2: Changed where the "decrypted" flag is set so that
  error cases not related to set_memory_encrypted() are handled
  correctly
* Patch 2: Fixed the polarity of the test for set_memory_encrypted()
  failing
* Added Patch 5 to the series to properly handle free'ing of
  ring buffer memory
* Fixed a few typos throughout

[1] https://lore.kernel.org/lkml/20240122184003.129104-1-rick.p.edgecombe@intel.com/
[2] https://lore.kernel.org/linux-hyperv/20240222021006.2279329-1-rick.p.edgecombe@intel.com/

Michael Kelley (1):
  Drivers: hv: vmbus: Don't free ring buffers that couldn't be
    re-encrypted

Rick Edgecombe (4):
  Drivers: hv: vmbus: Leak pages if set_memory_encrypted() fails
  Drivers: hv: vmbus: Track decrypted status in vmbus_gpadl
  hv_netvsc: Don't free decrypted memory
  uio_hv_generic: Don't free decrypted memory

 drivers/hv/channel.c         | 16 ++++++++++++----
 drivers/hv/connection.c      | 11 +++++++----
 drivers/net/hyperv/netvsc.c  |  7 +++++--
 drivers/uio/uio_hv_generic.c | 12 ++++++++----
 include/linux/hyperv.h       |  1 +
 5 files changed, 33 insertions(+), 14 deletions(-)

-- 
2.25.1

