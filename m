Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9DC1A3160
	for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219482; cv=none; b=ueoV97TSxbFtw4dCS7Qi9845KYIRfVZ1AGIpG4mJyU/wAlHnNmLRxc4J8mIgwOZw/7hBsW9bZl85oJlG4MFYQ67lkJidqn7FHOFbRUJYY+dOgxZhZdxt51lBzo73Vn/5j/Arg5yL7mwgXn41FLXAM5WQAjwjK5lOUH2zG/IsdCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219482; c=relaxed/simple;
	bh=MUfdRUEiHnVw1WgnwmaZ1IXlokSHEukC0IVBDks3u6w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eGuzOdoEjoReAdrf6RQtjC9lhUloRgvPotHKlXh0XTzsu3+3bxiKpv+10M4Emyrm/J4kDVyM9Rj8/WLOADdfDjqxGGz7nVsW4I5cE7PpGNCEDy6fE3S61g0UpFz0737T2YoZrT6BqP5R7G3sSzCjhjQ+8mDjbMc93C/jlAh5gcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZcpIidvZ; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZcpIidvZ"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-842688fa7b8so864186b3a.0
        for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782219480; x=1782824280; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUfdRUEiHnVw1WgnwmaZ1IXlokSHEukC0IVBDks3u6w=;
        b=ZcpIidvZuyqYw80UUdqWvRuoKLzDmFhMoS7RJs6SWzgxwj9hs5tQKX7z75HIcLzhRH
         S+Cp6Yvoxc5Z8OqWyLjFlqWCDgJLSsYJKoQftccQ0wo7bzNeX7kBhXGNBHLFTPBZD1Ol
         pUlgbsyyuuWvlVx6GJ6U86Hxu5b7P1YCWJLYT099L/1oxJdAzO2O2OMhF558HVt6vSnd
         aci5Tp04hk/7Qhcw5FApb7hk/uh0bu+cTILu+6wt8dBLlYxSKTfmTmYRiPUk/PZ2tPox
         /YbLhStp8j0roGJ8h6/zaH+bNoYBa+phE1VsT8Gne+z/A3xj4R+EciDRZzwXLnXMjpYB
         atVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219480; x=1782824280;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MUfdRUEiHnVw1WgnwmaZ1IXlokSHEukC0IVBDks3u6w=;
        b=YoM6nmKDH2JUJjU1A1wbzjG31x9xrtcwVjUnpMszxlAO/BsFhgfDWuWw5Pm0/S6p90
         D/mfjAFsgZ2tSvjDJYeucBlWsOhiC43Mj/mF739O6uSQkJqg6yDNeT1aFPd0Ca8UWzpl
         tczuTIdtqgn4ZsDwW//ifWW8eECAfN0RRez3zESEeLkwi300iRMX4YlvUf71VQJ/ZrDR
         6BWHgIDl9haKhXi7tu/1JyGI6drmWthvQoUwwON4N0lsJ6Nl5rWExsWLJPjlAvxqgezE
         alCB5g/VnhDbuoxuh8Uj9g6hDAXqJJxaf7AaOUAwEz41QW/5PQTAUncf9ZZl6FoWWnrs
         HQYA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7uaJ1hUcHZoco4mJPM+etACcFT6pApGpWEzhmDlWB4yVe5xP1JrbebhsOSpqeaRr7Viw25TD2SGk3@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+zEZH2iwSACYNCofcKJMcgfeY4JSFewhzv38XDNYO7QecG6jP
	lvycmGy5Ke4lwLsxCyjcvYHHQNEsRkTzWeFofxXLpBCN4ZQY709tkrw4/Tt7iB1+3PO7KkUA2aR
	XAbxTZw==
X-Received: from pfbmb7.prod.google.com ([2002:a05:6a00:7607:b0:845:9e1a:1d94])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1394:b0:841:d7f6:7286
 with SMTP id d2e1a72fcca58-84591c68753mr3097217b3a.18.1782219479903; Tue, 23
 Jun 2026 05:57:59 -0700 (PDT)
Date: Tue, 23 Jun 2026 05:57:58 -0700
In-Reply-To: <20260623091556.1500930-4-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260623091556.1500930-1-joro@8bytes.org> <20260623091556.1500930-4-joro@8bytes.org>
Message-ID: <ajqC1k1VV23_Xe5F@google.com>
Subject: Re: [PATCH 3/4] KVM: guest_memfd: Add `write` parameter to kvm_gmem_populate()
From: Sean Christopherson <seanjc@google.com>
To: "=?utf-8?B?SsO2cmcgUsO2ZGVs?=" <joro@8bytes.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, x86@kernel.org, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Joerg Roedel <joerg.roedel@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026, J=C3=B6rg R=C3=B6del wrote:
> From: Joerg Roedel <joerg.roedel@amd.com>
>=20
> The call-path of kvm_gmem_populate() might subsequently write to the
> page provided by user-space. This is used to provide detailed error
> information in case the page population failed.
>=20
> But since kvm_gmem_populate() only acquires a read-only reference to
> the user-space page via get_user_pages_fast(), the error information
> might be written to a read-only page later on.
>=20
> Add a parameter to kvm_gmem_populate() to optionally acquire a
> writeable reference to the source page to make sure page permissions
> can be enforced.

Already fixed, commit f13e90059908 ("KVM: SEV: Pin source page for write wh=
en
adding CPUID data for SNP guest").
