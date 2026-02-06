Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08411302CBA
	for <linux-coco@lists.linux.dev>; Fri,  6 Feb 2026 22:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770416924; cv=none; b=mviM13UHnXV6Jwn+HNmmOsFK6yK56+2w+zAwAYaphmw+S5eBps3cnk/Ym1NIsA6bG9Ee+RoUyNXLO5IJO5dSbbBIHp3CNINIC8amaldMu64QTM6Ka3OSik8mGTrsPVHL89A25v7c4FIin2TW0OG2z4qh+4QaO1c8mN9+dhxxGj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770416924; c=relaxed/simple;
	bh=5WlBpXcTHGuxWH4iNnba8FpIkK+3C56TjrsiYnNMy1w=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=g4ylO50/av9oleXySoCdRUR7fT3KwI8fgyynwc1PySkik3cieDbVTrufTTLqNyrf//CEVLa3cVknC7Wy4krI0nFngMsEuiD0OZt08OBVrVxaGlz2AEa1ujSvwNTxjLxVFPviPqUIy4jFzLHCSkWOeBov/Ndh4trARVOykFOtTZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1cpl+qqX; arc=none smtp.client-ip=209.85.167.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1cpl+qqX"
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-45c9878359dso2213156b6e.2
        for <linux-coco@lists.linux.dev>; Fri, 06 Feb 2026 14:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770416923; x=1771021723; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Io5HDeIklfld3UNsVscq5IsVk6UhJkXyB1ydmVsm80I=;
        b=1cpl+qqXJKmKQTH8Cy4VOmyc/wHq9opg9+WBivP5zpkEwnEjexkj/jahLHOw/DAQIY
         UzUKfCdyjCUP3NZbx8NzBwCzePaGxw0pmY+yBkx/HxYPZ5B9eD1Zb2m564uczRee73vq
         eJonvO5Jl6/zLosnF/mx3Gf5OKW+cQLBP1EX+837CBTlH0sjzOjRC+2t2Oy75FWLhqQT
         50vxUXT68D1NH2uVqAaAeUvlVHzDItjIkCCytiuNc6fNOTE4HJw5tYHAgaznyfq0Vb0D
         3ZYjsgbcaHR+L3IMrRqeR6iYsasMlp4lGad8wKS/5c+XdrcZPdz2zfcyXHlFvO4Z2UGJ
         5gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770416923; x=1771021723;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Io5HDeIklfld3UNsVscq5IsVk6UhJkXyB1ydmVsm80I=;
        b=FZSb9baofOqcqvLThgWf2oOoOomjeHFdC6uC1/4HfdS3WXe7mzEIKGEU52yrFwG0CI
         Yw+PT71NMvJvIO4+cEkYe6w4zPW/rgkmUndMx2qjPysyk2ZOLERd+dOqzCEcGITU8t1C
         D4mqNHuxu8zAjoWkxqkZgMsYxcsxcpxFMa/lfbhRrSDLjgI8k33+LF9wMuKLcyoGe7Rq
         bBQZ26NnkOZEmIIoCz+U/UAyZg9mIMq3tzlJxvZEt3cCWtW+FTsqotF362JDduyi/YUG
         lDSg8A3+V8iPAZm5ziZHS38CnAiu/rkjF5TWPqIY2w3QHe/eNjyujcC6uofFTxfBrgh4
         eiWg==
X-Forwarded-Encrypted: i=1; AJvYcCUghhczyfGbhiJRGipbIznaiSkAv2CeBfEVwF4S/NSCuQ8laIT4CotDhQu1H2LDj+eSIFbZ0oaHHPd0@lists.linux.dev
X-Gm-Message-State: AOJu0YyOfAZe4r27ohUQqH64roWdsyWK4qHxJB7VmEv12cNEivXln2YN
	rmKXdBEl2KgPeKPX3Bzm5E1e39YG2tFaRySn+kLPbdHfktjIThUjwfu1/cDZooKU8/L74BTVXOJ
	dWg==
X-Received: from jasx4.prod.google.com ([2002:a05:6638:1604:b0:5cb:209d:14f7])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:a4a:e911:0:b0:662:e066:7397
 with SMTP id 006d021491bc7-66d0c855e86mr1825095eaf.71.1770416922857; Fri, 06
 Feb 2026 14:28:42 -0800 (PST)
Date: Fri,  6 Feb 2026 22:28:27 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260206222829.3758171-1-sagis@google.com>
Subject: [PATCH v3 0/2] Extend KVM_HC_MAP_GPA_RANGE api to allow retry
From: Sagi Shahar <sagis@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	Michael Roth <michael.roth@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Sagi Shahar <sagis@google.com>
Content-Type: text/plain; charset="UTF-8"

In some cases, userspace might decide to split MAP_GPA requests and
retry them the next time the guest runs. One common case is MAP_GPA
requests received right before intrahost migration when userspace
might decide to complete the request after the migration is complete
to reduce blackout time.

This is v3 of the series, v1[1] and v2[2] were posted as standalone
patches.

Changes from v2:
 * Rebased on top of v6.19-rc8.
 * Updated documentation.
 * Restricted SNP error codes to match TDX restrictions.

[1] https://lore.kernel.org/kvm/20260114003015.1386066-1-sagis@google.com/
[2] https://lore.kernel.org/lkml/20260115225238.2837449-1-sagis@google.com/

Sagi Shahar (1):
  KVM: SEV: Restrict userspace return codes for KVM_HC_MAP_GPA_RANGE

Vishal Annapurve (1):
  KVM: TDX: Allow userspace to return errors to guest for MAPGPA

 Documentation/virt/kvm/api.rst |  3 +++
 arch/x86/kvm/svm/sev.c         | 12 ++++++++++--
 arch/x86/kvm/vmx/tdx.c         | 15 +++++++++++++--
 arch/x86/kvm/x86.h             |  6 ++++++
 4 files changed, 32 insertions(+), 4 deletions(-)

-- 
2.53.0.rc2.204.g2597b5adb4-goog

