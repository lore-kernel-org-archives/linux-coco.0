Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897011;
	b=tgEMakaJRzcsZzdpANzsQ5H3jRXvjxt2ldq6wVfXJyPM0Ajgn43BvWJ2g3nEAqkwG+g0
	 SpJjPx/2OBpKTAUbktV1g+dasvx4FYG4ULZc+/FU6v31zuI1wOh+7H2wW1uyjuaXLCxKn
	 DEuXVFFNmfRjTtLPlw1+9trUL+V4AvlA8BPRDwK6aA4FIp1rXeenesDpL/X52DMfNOm1V
	 ZSn3wnJnppifFzwzJUbKN4mQCHy5wfxIvNR0mekMkl7rdCnWCBK/LBAHO3K8L954E+vYK
	 M9dxIYDXr/fW/wHbNKMu5vMEwuYMcqMGT5qT1N6Va8zNz7ckzieHoBf7Va1rNnpXDmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U2gshDq2bNSNVDi2ZZPuvyhhYbiMNkYLcIK7Najb9DU=;
	b=SfsL2b/IwUPptNvhZLB/SRxcLAODyDoU7gO+FVK/9DajKe7K/8Xl6MMxJgkpCTFIWTSD
	 QB0q/EvmIK9xYxm9+EEPc4Z5qfbKgh43PVeJsMEShovztrkXMZIzlb3OGa6uOLG2VIZ60
	 fswxDNWQXzQKR4RvkXnIRU079CJ3+POUmJ1nA25GroWTQJ1r5NEXJQ1swHNvEPvvzpaob
	 STxWTN3zrdm7NGt4EzUTFwXmo/lmru8yz144GQOElZM+djwSgq7ldSUQZHQq4xEsBhJYl
	 Jzle2vzW71RMhttcaLrhQrWBMurXaLUjaKuIDjWUrhB6WDQRjDFgzOdC0tztPtmD/gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tcv55IF7;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E40E606A916
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 16:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E40E606A916
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tcv55IF7
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91c7a0c1617so28227656d6.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 08:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897010; x=1794501810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2gshDq2bNSNVDi2ZZPuvyhhYbiMNkYLcIK7Najb9DU=;
        b=Tcv55IF7jyfRbNe4RtbtdN5PUi4TPdL+aNV6hjucMCntL7Glz4ynh82gEdEpzdfzo9
         2+7GM+nb/Ux9y4oSyRh/9xpmnNLbF+LwvO8mHfBgWPh/oqix6jYjheHLyBvYPSXxHIHd
         w2ImdC/V0Uv/oImzzE9UU2Qvvf6aL8mmU/320UrsjhSmJaD766s8w12SBvvvmMFAukx4
         yxcNeWBaSCBodcdrCBbJDVHVkgdWkWbPmP/G+TxKYWagdw6apAxZXCN+aX9xW18CRDfx
         u/y8uiicX+YwkDTlWhHclG5kT26Qf2OF7wIGXk0dXhH6MrPfPwZc8AAIWrn55GaDgRzy
         bYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897010; x=1794501810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2gshDq2bNSNVDi2ZZPuvyhhYbiMNkYLcIK7Najb9DU=;
        b=FWq5eIarCIVtvW6RUOyuNExrz/1SUpl/3xMIBdAFJyTfGzfUc7ut2OqwUnhMcEciBg
         JjHhDn0xIYDIW4KkEmsuH0q8Ev4MNq8aGvGsrqMZgbqWdXM47h6RVIJcHsfHu/RXPZV3
         DSsPzcVi5xkFF3lsRz/ATl6T/UJFW/+18LrcPO2pVNsBOScKQLrmd2w/Y6iH0oLg2cJi
         NT6MpV1gjXOO4APSoDSI3oUsKvm7Wpq6pSfI09wVbCa3gCucZl0NQGHaidhgMx7wbT9E
         GIr4AQm0axtuno8vbYXhYOkhj7LbA7eTVQnrKOjFZKA+CUjzFM3GDjso7m0gFMs6r+AG
         sHSA==
X-Forwarded-Encrypted: i=1; AKwUvBwV5gpHRslM58E3U/MlI6ocWJ77zwHM5tofz0DiJMj2uNNcIMY1bBJDpHMRsezB//Qd/2YfeM2y4W/F@lists.linux.dev
X-Gm-Message-State: APuU4Z81IXZ5Vlkkh1MjADfcU5jXKoVvX9HOEFHbjmOpUUI0a+9Yq0dl
	HqXvFmfYYsUgbAxQLbzXR19hucNk1HufobF3to1JqgIgaXHO+WqWfH9s
X-Gm-Gg: AYBFou0JmjY7K/mGO7WjFIa8mNXqQUfjIfT6JSgeigRBWyIwGdp04kJnxFaSowkoaYU
	fbGp3mWyc/FHGAeBwswveG9XamockT7zj3kiMLnLaDGOY2v8TOyQtruG474x3HOUc0EwIlXPvk2
	g6FFoHce0NR8C/O7TbatLFhf0H68oSBzeVn8nt7nTxasO+PrKFZT04UKgMovnMNdvvzZDW1j4xK
	cUTP4HkvaW8bqgTj7Rg002X8N7O4DFC50yZa4ahc223szm1Fg1QYYCbOEkJdvuSuEm5NPMgw/Hm
	IWZksxaIl04zESctsBjoQ0VIA2f7qirx1OpdoPl7o0hc5MGIykWStn8//Ptj8fLj7koBB19fnxo
	lndUcazPt3Ti/8sDM/+Cu1on6GLtUOzVZlQjXYs8QyrHnhPoILK8TU4AbuUsztPkb5IS6bMcQjO
	l6jTurRVhtwcVB5nwrPHiglViNEHs9NNfbe97cE9fzl13ARheOq/PZXPPxzcdpcMvPOjL8sDi3V
	JieCopvPIbAIy38FOeG4F0Vq1UkiH2Ix3atE+qTV/wximvhfJKW0C0809kDMVa5YGQDChsWfrUG
	IBEyxKtc9wxK71Ey003ipgZ+zCvzYAJF36OpZQuWHVTtgCyaou12a6r+pFD/AgLFmibF3UlwGy4
	=
X-Received: by 2002:a05:6214:501a:b0:91e:8e12:f594 with SMTP id 6a1803df08f44-91e8e12f9cbmr74222216d6.39.1793897009503;
        Thu, 05 Nov 2026 08:43:29 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e97b5ae75sm22803706d6.38.2026.11.05.08.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:43:28 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
	netdev@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH net-next v1] ptp: kvm: x86: Leak clock_pair page if changing its encryption fails
Date: Thu,  5 Nov 2026 11:43:08 -0500
Message-ID: <20261105164324.23501-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a confidential guest, kvm_arch_ptp_init() shares the clock_pair page
with the host using set_memory_decrypted(), and kvm_arch_ptp_exit()
makes it private again with set_memory_encrypted() before freeing it.

The untrusted host can make either call fail and leave the page shared.
Both paths still free the page: the init error path with __free_page(),
and kvm_arch_ptp_exit() after only a WARN_ON(). The page allocator can
then hand a page the host can still access to an unrelated user.

Leak the page in both cases instead, as was done for the same situation
in commit b9fa16949d18 ("dma-direct: Leak pages on dma_set_decrypted()
failure") and commit 03f5a999adba ("Drivers: hv: vmbus: Leak pages if
set_memory_encrypted() fails").

Fixes: 6365ba64b4dbe ("ptp: kvm: Use decrypted memory in confidential guest on x86")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. Compile-tested
only (x86_64 with KVM_GUEST, AMD_MEM_ENCRYPT and INTEL_TDX_GUEST, W=1);
I do not have a confidential guest to test it on.

 drivers/ptp/ptp_kvm_x86.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ptp/ptp_kvm_x86.c b/drivers/ptp/ptp_kvm_x86.c
index 6cea4fe39bcfe..811758bd8b0de 100644
--- a/drivers/ptp/ptp_kvm_x86.c
+++ b/drivers/ptp/ptp_kvm_x86.c
@@ -36,7 +36,7 @@ int kvm_arch_ptp_init(void)
 		clock_pair = page_address(p);
 		ret = set_memory_decrypted((unsigned long)clock_pair, 1);
 		if (ret) {
-			__free_page(p);
+			/* The page may be left shared, so leak it. */
 			clock_pair = NULL;
 			goto nofree;
 		}
@@ -68,8 +68,9 @@ int kvm_arch_ptp_init(void)
 void kvm_arch_ptp_exit(void)
 {
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
-		WARN_ON(set_memory_encrypted((unsigned long)clock_pair, 1));
-		free_page((unsigned long)clock_pair);
+		/* Leak the page if it cannot be made private again. */
+		if (!WARN_ON(set_memory_encrypted((unsigned long)clock_pair, 1)))
+			free_page((unsigned long)clock_pair);
 		clock_pair = NULL;
 	}
 }

base-commit: 0822d2fe38262e8b55c5ea55c970022bca8dd2a9
-- 
2.43.0

