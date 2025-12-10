Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064C9137750
	for <linux-coco@lists.linux.dev>; Wed, 10 Dec 2025 01:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765330225; cv=none; b=a3zvXCYEx4JQ15hyx2G3I+d33NZ0jjZopuj/C6PWCf4dVRHuzIGIXD73m6Dd+23T1Cwd43znb5H4M/Vk19l91sVBGht6ilqyUC5GBR63SYsrhUrkFBV6Dy7R0jp0bDI5Tfmui1o3HH+J8lNBOKfNP+Loa7Cu1RkxYV91F+0HKQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765330225; c=relaxed/simple;
	bh=TEZjehRxrB+UPe0+HJci/NcWrRT8LAqyVR2B/TVryps=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qp+yMZkojykqQaAVL2WGl2FOGuiJIXG1XtU5TmYGesW/zqwMAjUw+CmVF1bnzyjpvmna5YvuW+osGhK8xyaw+aYu+XAXD+JELjmlaoJLFMb2ooTa8aecYdbfl0X8dTyyDr3xBw6N/0no/o79nbpNQ4HYeCFeAeDIr+4MVCAdr6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pxBHxH8D; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pxBHxH8D"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7b952a966d7so11931343b3a.3
        for <linux-coco@lists.linux.dev>; Tue, 09 Dec 2025 17:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765330223; x=1765935023; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bzYVdiyOUB89PcTxYLbA315w77wh23i5yN1FuYvCu0c=;
        b=pxBHxH8DCcG6raDtugBdwLK5eLWlpLH9ke/ELuBV0Eb8g/hDjf0LoKkRxlBbzFiiKW
         +hFvHN2gFiWdkjShcSAEgEaRwuZtXLfPxkhm8NmZK5KKVKTsbmTJT4eSqdcWzcHIomtT
         zT5udNDVIV4vax5OVg97lFPN4XmMdLhxOtgrYj+FTsu9ol2ZI/GKTUdGikv6Xsl+QJ9v
         Zv1pq4a3ICLx2A5dzEt8w4s/Rxu9LFxBHMUg8YcOGFNdUmeXoLrHjOEQFhOtNdD2Gg5N
         Hi5yOLgEAYAtawhFHadqtylsCluRgxgT7FLz8c7YedyjiUxjGWkkwn+Iq+rN3TzVvigk
         BGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765330223; x=1765935023;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzYVdiyOUB89PcTxYLbA315w77wh23i5yN1FuYvCu0c=;
        b=WQk/n2JYbE6qNzAj9U7FSDQAFjgny2mNPS0xadcm72gFSncWBOqU8e+G6S8OdBDWVO
         Wy7aKdfd49a0tAHKYzAY+7YUoeXglehgGYZu/ZJXYdzeZmSl8TSJsMictj9M9ksuFqsf
         rrZC6riN0muJD7N9jtbOz91ygmsr+vj9uVM+Hhezz1N0UDovDeBbpHWGoKSQtiBWByg+
         VLlXfmClg9xFP5e+XaLL4++TTM5A7QQLKZ9VlWSoP6c77dRnBbBIjj4ofqQWlZhPq60o
         VNP28D/pb7PopV9L/Et3e6A0ae6cRZxRGw9sZNkqQ/TE8PHqYY1c6ToafK7SxyvIouW3
         YaxA==
X-Forwarded-Encrypted: i=1; AJvYcCX3A3uNo8F2GQhBCRzhOT9/CX2m77IHGfhjTj83oFGkBJtszaXZJRhMP0zMI40FZ+jvYC0HQak6l6vQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1FCGuRlLry7BCLvbB9xSn6rRzQBd0luR+KbdUl0YV93jPDlwk
	4t7IuEp8nQFVlpBZTJhyn6DMJ9T7Hpk8NV1ksmJLRVb/rmJurY9ZMlWqCCHByEJyFY6u2dMh6zI
	PLmh+zw==
X-Google-Smtp-Source: AGHT+IHCoAoYGyPw5j9JBku0hHTxP/A4fWJZOerFAj0Mbk5JHgReKtVWkoA09cZ+6DnOUbpNy+4DPxRjdBM=
X-Received: from pjtd13.prod.google.com ([2002:a17:90b:4d:b0:349:d3b1:8ea4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3394:b0:35e:2a82:fdf4
 with SMTP id adf61e73a8af0-366e2fb7523mr592380637.59.1765330223201; Tue, 09
 Dec 2025 17:30:23 -0800 (PST)
Date: Tue, 9 Dec 2025 17:30:21 -0800
In-Reply-To: <5649e224-bb6a-4b63-bb27-5541216df0b6@suse.cz>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251203142648.trx6sslxvxr26yzd@amd.com> <20251203205910.1137445-1-vannapurve@google.com>
 <20251203231208.vsoibqhlosy2cjxs@amd.com> <5649e224-bb6a-4b63-bb27-5541216df0b6@suse.cz>
Message-ID: <aTjNLdxvmAMuo7VG@google.com>
Subject: Re: [PATCH 3/3] KVM: guest_memfd: GUP source pages prior to
 populating guest memory
From: Sean Christopherson <seanjc@google.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Michael Roth <michael.roth@amd.com>, FirstName LastName <vannapurve@google.com>, ackerleytng@google.com, 
	aik@amd.com, ashish.kalra@amd.com, david@redhat.com, ira.weiny@intel.com, 
	kvm@vger.kernel.org, liam.merwick@oracle.com, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, 
	thomas.lendacky@amd.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Dec 08, 2025, Vlastimil Babka wrote:
> On 12/4/25 00:12, Michael Roth wrote:
> > On Wed, Dec 03, 2025 at 08:59:10PM +0000, FirstName LastName wrote:
> >> 
> >> e.g. 4K page based population logic will keep things simple and can be
> >> further simplified if we can add PAGE_ALIGNED(params.uaddr) restriction.
> > 
> > I'm still hesitant to pull the trigger on retroactively enforcing
> > page-aligned uaddr for SNP, but if the maintainers are good with it then
> > no objection from me.
> 
> IMHO it would be for the best. If there are no known users that would break,
> it's worth trying. The "do not break userspace" rule isn't about eliminating
> any theoretical possibility, but indeed about known breakages (and reacting
> appropriately to reports about previously unknown breakages). Perhaps any
> such users would be also willing to adjust and not demand a revert.

+1.  This code is already crazy complex, we should jump at any simplification
possible.  Especially since we expect in-place conversion to dominate usage in
the future, and in-place conversion is incompatible with an unaligned source.
