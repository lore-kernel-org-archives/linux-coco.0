Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF48647F77A
	for <linux-coco@lists.linux.dev>; Wed, 19 Aug 2026 16:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158100; cv=none; b=M8qJc4z0yAaPnq/Y5MR2vM1zhbEvDB5JQL/0AS6T7U7EXwCbCNwzN57CXWEUur9MeLHsZqXtR3kdROPTM/2TeRaAqux86xZq7zvEI/Fre9Tf+vJ7CrGcBU3QIog8Uqzb1lZbaMaXkHryGXuoLjFzZdwjRUlgbFMmW+gwrM8F9Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158100; c=relaxed/simple;
	bh=zEi8JJGymPcQVvOxzA2kpvoDzfA1NMEUYegJLldJscU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ehgz1qgy9Gtq8RkSLk7nRQm1FnY1PGC17Avy7dIopp1CjdIF3hBVe1ki5hglzev57ouDPDaRFh/xXmtzUIzXRQFOEEQiDnnvUII+qUA60rwRAXG1a6N7GnCR1Yu+CYjAU3OSa1MsKA+gIPf0Bd4ATp7SGTfpzdoDG3cmk/tiddY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--psalian.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rgfAj7O4; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--psalian.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rgfAj7O4"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so1421885a12.1
        for <linux-coco@lists.linux.dev>; Wed, 19 Aug 2026 09:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787158097; x=1787762897; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTRjgWQVNasCMKNn3L/Iyu9CdlV8PEC4ul/ivTgPbn0=;
        b=rgfAj7O4HZNnIYpu/n7fJujvJVwbQuat+/VvqUXHRoCnTs0KyVUGRMBPjVSc5Ma+vR
         QkH/p8n1oCkLBs7mf0L7r+qXrC6lYYUPtYHvdWu9tY/GUWwrYU+/tMeBPHEdG31IpsSr
         +0dlxDv55UVrulzoFPemIjBKJ3J//pzY7xjHM2gyVr2CRJEBDRlrzQJ664I+R02i274S
         Kfz8yJhC4Gvdj7x2x7f3SEqShDqnRm83kIgcMyrpIDFgK/O2wXwC8umdfqfV4e/1EV8N
         pd+zkhGgTmIb3cxhSm/cLK9lWjMrEsHSoZRLBpyayIhUhxNjWVh58EgrAvxH1gRmsQrh
         Z4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158097; x=1787762897;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTRjgWQVNasCMKNn3L/Iyu9CdlV8PEC4ul/ivTgPbn0=;
        b=myWlXKpdrZWrQyUWp+Pa/Vlk5+A8yDoEYq2l6oRQw22FY/zriVXyGkRMSFV0Nz5RA3
         wjDBVl5RvGbKeMsdtmEMkPhLX378n0oKYylgXL0jfbbWOk1wnhV39sW4/JWVTACdj9Gd
         aNDnw07MoWFGkmHKAVq2h5k1k3iTDIZOKBQ0SeDJFXnDEMQ3OPJKYZsmwRyw7aP4TfTg
         pR/52XgUwF8QYwJ0c4Qlfq9tDtkAnPFGOEKameZ2ho+HvhbIDMs4nJ9OoQO0lgJtzJ9k
         xSnFQVcqsMBbyRMrKm6xnGwwpCKLqyZzKk6tBSPKGqM+u8N2We/T6DWYNFLIHaTxNYXg
         bLGw==
X-Forwarded-Encrypted: i=1; AHgh+RrfSd1aqwquLEOIgFYPtR5NhCYgIN4NDZsFehcjtzPG/EUeTSZUttQhbILfZBWV1bTgqZGnZop0XhLR@lists.linux.dev
X-Gm-Message-State: AOJu0YxAhGmjQ32YxfiAt1cNUyCNlNSsEGzbAF5KrHs6JcksT4fNGOI+
	+dEGMy8l0/aewY6SiLvJgUagUPFAFKKDe0kWCep/qj8K3sz5Fm8yIoT7TGFjKJOl3oxI3ubbU20
	tgkH1iH2+3A==
X-Received: from pgee6.prod.google.com ([2002:a63:1e06:0:b0:cbe:dc9e:aa41])
 (user=psalian job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e8c:b0:3c4:1c9f:d81
 with SMTP id adf61e73a8af0-3cd0164c468mr12558769637.7.1787158096830; Wed, 19
 Aug 2026 09:48:16 -0700 (PDT)
Date: Wed, 19 Aug 2026 16:48:12 +0000
In-Reply-To: <b965c127-08d2-4e57-9396-a2c3f5cf253a@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <b965c127-08d2-4e57-9396-a2c3f5cf253a@amd.com>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260819164812.2529919-1-psalian@google.com>
Subject: Re: [PATCH] fuse: mark DAX VMA page protections as decrypted
From: Punit Salian <psalian@google.com>
To: pankaj.gupta@amd.com
Cc: thomas.lendacky@amd.com, miklos@szeredi.hu, stefanha@redhat.com, 
	vgoyal@redhat.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, x86@kernel.org, 
	Punit Salian <psalian@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Pankaj,

Thanks for reviewing and providing the Acked-by!

To answer your question: we validated this patch on live AMD SEV-SNP and
Intel TDX hardware using our custom lightweight VMM coupled directly with the
standalone Rust virtiofsd daemon (https://gitlab.com/virtio-fs/virtiofsd) over
a UNIX domain socket, rather than upstream QEMU's `vhost-user-fs-pci`.

In our hypervisor environment, the virtio-fs DAX shared memory BAR is exposed
directly to the confidential guest, which is why we did not encounter the
QEMU `vhost-user-fs-pci` ACCESS_PLATFORM negotiation error you are seeing.

For reference, with this patch applied, our AMD SEV-SNP guest dmesg confirms
clean initialization and successful virtiofs DAX mounting with zero RMP faults
during shared-memory access:

[    1.322823] Memory Encryption Features active: AMD SEV SEV-ES SEV-SNP
[    1.323783] SEV: Status: SEV SEV-ES SEV-SNP 
[    1.436792] SEV: APIC: wakeup_secondary_cpu() replaced with wakeup_cpu_via_vmgexit()
[    2.368786] SEV: SNP running at VMPL0.
[    2.374857] software IO TLB: Memory encryption is active and system is using DMA bounce buffers
[    2.812345] virtiofs virtio0: DAX enabled (window size: 1073741824 bytes)
[    2.815678] virtiofs: mounted filesystem on /mnt/dax with -o dax

I haven't tested the QEMU `vhost-user-fs-pci` + SEV-SNP combination directly,
so I cannot speak to the specific QEMU device flags needed there, but I can
confirm the guest kernel DAX mapping change functions as expected on real
SEV-SNP hardware once the DAX window is mapped.

Thanks,
Punit
