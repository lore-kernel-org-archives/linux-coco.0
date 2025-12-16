Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB0921D5B0
	for <linux-coco@lists.linux.dev>; Tue, 16 Dec 2025 00:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765844355; cv=pass; b=g6pxlBqURL+kIMrsWpUhhfeEyCo5heeyXHL8KmRFpTtvve3q5VRRkry8RRm+1MKhBD1XPxwnSxvmwhbP9Q2/BmsoTnuNcEIH7b9kqErf9b5QyXl+fgJWj2arJ0qZF4RkdzNpPFic4mbAdqG6V+E5bCk0SDUXJ/JRad+uRpIR29o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765844355; c=relaxed/simple;
	bh=y3+CB9jJkDY/RuF5+3mG73XjTAnHhCai2n7zifE/14E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLpb0Y0R4Tq5ycmTxm+uuf3g50lJAHWXy++SM/2fbbXFuVtgSNuNUZj4gVZtH76rqL869U81ADShzoqQIlToaYyJrYD/xXOLdIZxFhS/KMwn+5YLvduPjTrIe+sQ29okQykiSbpAx6tf4vJG6VhNpUp24rUCz1SdwCDWiCtUXmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k/tnEDGl; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k/tnEDGl"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29e7ec26e3dso47095ad.0
        for <linux-coco@lists.linux.dev>; Mon, 15 Dec 2025 16:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765844351; cv=none;
        d=google.com; s=arc-20240605;
        b=dEb4yINgCoUZAqnQ8YSutFeDXxDuCqtjVTUh54uiCe50fBPW84DbFDjn0evzfqQTv/
         ONUXoYafHXTjDXYZHuB1AzDYcIQep5b8B2338ZgOZ7o2XNWqCRZpuCF31v4VYvcauPyY
         9yeJQHCj1SkcRutyJGRObJKdJLMlMolXeVr2i0gqAbAFIL5HhW00UtUisEMuIXlKH7Xy
         SVgXcWDRPDY4M2q8tNvST31zi16RMwssUI3AUFJ0yole74fQXCPzKGh+8WPhJakiUfrK
         xRnDkaGmCCwvjrNqv+RvR/Wp5xfAjPVzn5lWRL5b5r7npICe2jPoT2NiHqUQ7pkrNrjR
         qN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y3+CB9jJkDY/RuF5+3mG73XjTAnHhCai2n7zifE/14E=;
        fh=X04fSC3Ekyir/sDy9gKSi78jXa35BvbnEv5Z/MHc+a8=;
        b=e69Ixkl9qVvv4VAtzRi4JgOQidUXGdePhta6Ze0aSXpv6ldcL+4ElFSKamgy4pfD0O
         cjKhYt7GIIduebG4/osjHilhJXU8DywFv6ebVi7HtevVrgrUGVdUIOLBQWBjEJejoRyW
         8kgRBxH/tohNnM93qYruJp56J91vruPS7RA4nrqJykHQF5HaJrLiOXW7wryW2mvehLkr
         LVurtdPtHVtUi9iJFRI4oKOnipWRPv0/LiwMQyTctsJAb7Sp+7AVNU2IfrwCL/i8wdog
         vqLAYaFHeTREtta2H1NDaMwxEWmaIM3wlfX+Sb278Z+Pc+U/N/+UC/7AMvnaawThsCZg
         ylHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765844351; x=1766449151; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3+CB9jJkDY/RuF5+3mG73XjTAnHhCai2n7zifE/14E=;
        b=k/tnEDGlRFEJpG7ypExqt5z5tBuqAuOFRV7oxRsmPFeKpgz1a6mWjDXPl0+NTkZjKR
         9z3RVGGXTJdJFozyq60Kl5EmoyCsnqYH3EFh4I6GUlbV94xf2sF/ELmQYre+WxmEXHWk
         rlLNcldEPP61+JL+amYIm25TJRlNzhOTFeUYrGgATwa33ImiJ2CgyA6D4aqLcqDS3cKl
         4ZxQRV0T8Nwfj9NmkHtXD1e4Tbym66tycGmxWMM0mHXgsfRHLa7kcheWRpGfqDMLazlz
         G1xkroXutQJHphu8E5c6Fb8jjaUhpM8yz4LCBSvFanzf3yd6cyfEWts72SEU2QT6IiDt
         bOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765844351; x=1766449151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y3+CB9jJkDY/RuF5+3mG73XjTAnHhCai2n7zifE/14E=;
        b=dwa0Ud20d+6B7LfLC1Pp03ulzWRpDQ6ffYaK7fQYJ/1ULjU562iMmcnah2XtAJwOO0
         QFaAUk/RZ7l3UqMnR2JyCzdNTotog3mnSRE7Yr7zEHBYdVLYuot+1VYuFmZqN+N5oJmM
         ZrspoDiaGEDzYhyR1eJlL54IDFELB09a4rhYGT8Lo0M6RvN24BxsG+auc/vQTtL/7GZr
         aWPf/H+9FnbMeMSeWDlRhYP8CfOXw0Bf54Hd4I7gywRaoXmmSeq1vIUPlOASPAcSrRbC
         ftcCZjC9cy4B4u6Cx1O6wPu5YKvSXvTXRm105GWY7vguqwFtjrTlhWBepsfLHX6ZlbQC
         Ep9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWE3wjk5CV6qxbeSkZqA6l90v++4aixaqwkXJRccmQIgQKVDR5HSACJHikRDW62O6Wcybkl9YCP37ml@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8BFj2sv6Ro9m+hhRaRnNY1JQuD9p8OcG90NVgsOLyPsFP/VVL
	0ljQtpanV9037EsYAfZitK9nzUhxSYU+AtgOgnVaVe2Sh9JWNLLKYDvEAAez9ELtQ0UYXEVCacq
	EAKCaXwA5q7PyrL5/BAYIWyLS91OC1DJyPPpWGLIE
X-Gm-Gg: AY/fxX6FsrWuSJpm3gRhSxxHv6A8joEUvj9Nm33UP9zP3WEOKFtH/faW4j/pt7CwNwW
	kybxDji8QKkFvP7wWHfy1WNZqEO4MEja70ufdk+t5mbynV+6R/qeeDPZWkMMi5FGRzQMFwLXNdr
	NzoCVEM5NhdXpapzKSuwPlUoJHSsVpfm7ySJwrepW5iS71FUHXGxvgImjHbjq7kKCMXRKzK7IXD
	RcfGlvUBCMyzP4MPiEwqkqIUblo3JIvn627z1jDCfm43gyxfe0UyxUbuhIP8xa4LavDBUxVwDZz
	q4YDIIPKRzblLD2Vl14q7sE6c/GS
X-Google-Smtp-Source: AGHT+IGBM7VWEq8LinkBSYV8x5ESzAOrR3yJML1qZ6fwh89ve8A15rNzyiEn6zhpcZCGpp2XSo8wGtGea9cBBpvSm0U=
X-Received: by 2002:a05:7022:988:b0:119:e56b:c1de with SMTP id
 a92af1059eb24-1205724808fmr225c88.9.1765844350465; Mon, 15 Dec 2025 16:19:10
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251215153411.3613928-1-michael.roth@amd.com> <20251215153411.3613928-6-michael.roth@amd.com>
In-Reply-To: <20251215153411.3613928-6-michael.roth@amd.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 15 Dec 2025 16:18:57 -0800
X-Gm-Features: AQt7F2pmUo8h-ojZ6qUQhapMaawZOTdDVwOKAdoTYFJZ9Oc6NFfbzoMtVRYUIYE
Message-ID: <CAGtprH983huiuu9w9JG8nL3cf5sa_FpJjEt2gOvVUKgGUxtdGg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] KVM: guest_memfd: GUP source pages prior to
 populating guest memory
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, pbonzini@redhat.com, 
	seanjc@google.com, vbabka@suse.cz, ashish.kalra@amd.com, 
	liam.merwick@oracle.com, david@redhat.com, ackerleytng@google.com, 
	aik@amd.com, ira.weiny@intel.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 7:36=E2=80=AFAM Michael Roth <michael.roth@amd.com>=
 wrote:
>
> Currently the post-populate callbacks handle copying source pages into
> private GPA ranges backed by guest_memfd, where kvm_gmem_populate()
> acquires the filemap invalidate lock, then calls a post-populate
> callback which may issue a get_user_pages() on the source pages prior to
> copying them into the private GPA (e.g. TDX).
>
> This will not be compatible with in-place conversion, where the
> userspace page fault path will attempt to acquire filemap invalidate
> lock while holding the mm->mmap_lock, leading to a potential ABBA
> deadlock[1].
>
> Address this by hoisting the GUP above the filemap invalidate lock so
> that these page faults path can be taken early, prior to acquiring the
> filemap invalidate lock.
>
> It's not currently clear whether this issue is reachable with the
> current implementation of guest_memfd, which doesn't support in-place
> conversion, however it does provide a consistent mechanism to provide
> stable source/target PFNs to callbacks rather than punting to
> vendor-specific code, which allows for more commonality across
> architectures, which may be worthwhile even without in-place conversion.
>
> As part of this change, also begin enforcing that the 'src' argument to
> kvm_gmem_populate() must be page-aligned, as this greatly reduces the
> complexity around how the post-populate callbacks are implemented, and
> since no current in-tree users support using a non-page-aligned 'src'
> argument.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Vishal Annapurve <vannapurve@google.com>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>

Tested-By: Vishal Annapurve <vannapurve@google.com>
