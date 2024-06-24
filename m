Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C3D19AD9B
	for <linux-coco@lists.linux.dev>; Mon, 24 Jun 2024 15:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719241337; cv=none; b=RWRh3E8bCYCkc/HaFZNoE9EHAUKKVqLPPSHM5PkmMmhNMiKECs9xrI9ky3U5qkFwsQJhgXIUTvRx3iD1yIUxaGGdV4O33iiPenlErNWvY3NxvMviD/PuEfsi99cO0J1C3ndoluqnWI3mXZaWPdIlcKhcMFpKDqvMENuZXFSUZsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719241337; c=relaxed/simple;
	bh=RWPDDMkBBJI5GXg8+0PX2He/GP0QafCNoivJOEpVWro=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bdnx9+SKLDzyWIvbYyqc4r9Xl3SIKn7s9CsnFdvGo9sF4+rItg4jAWhcN/KhHKrF+kGcMvgkDzsfsAOUdIaUFCpO0jT2FSFIqVR6X1OH0+R0IqG155xy8GnkCiRubFukpy9X4bS3KkrUlUgqwz4CiEIRK7Gy7eEly958QZJY6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ENxM+Ubc; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ENxM+Ubc"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-63bab20b9f4so79507097b3.3
        for <linux-coco@lists.linux.dev>; Mon, 24 Jun 2024 08:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719241334; x=1719846134; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4T/qiCTXUS9baKPXu/a0D1pfkxykAQu3gzK12/3rIc=;
        b=ENxM+Ubcl8TzSY/sR8SAnnqlg0tOiYtE+ix7jbWDYsC9vA/xyDK30K2ATMZgM0/kOx
         CdfwKEaCic2lT7lJeMoSz/qeaUhthATKD8+LqMp1Xl1JdGiPOok4Wfchw1B3/fg+N1Lq
         Ndth1dB6rGiqddCPrIeYgEkiq8Td6Ht4JKe+0Vn5qSfIARnwOoU0fklUt2m8EUwru8YE
         XCejpeJVdScqS7P7kO0NYrbWn3j36wXGfrCeoJ4e2XjZYWk58IcJycSC7rRtNGFurhrH
         ycg/4a2sr1CJJAofYg3vA8IpNXUrv7TjcylpbpnDPHXbTx4kssW4+o+p7UubtzjzwSeD
         bMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719241334; x=1719846134;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4T/qiCTXUS9baKPXu/a0D1pfkxykAQu3gzK12/3rIc=;
        b=kAFIqTH2l3t0sQBcZDZKpAqi6uaN9ww3XT7jPOypbVharEneOf82jl/rt8hMchNRrF
         +ybrhK0b+P65YdBQ49sClBPOIbW/RDUL7a+pBZ/NGVFtlezkUkqzCUtv42qQ5LD0h+1G
         6htuvRtLbi0BDkG4bzqlLMDFqpTOnA4JP+vlDpfBnsC3ZV91KYNxVVTm30n9JTxvpxvH
         frAVWOyA3LebKvRGrpR8bIL7ctlDKx+2MOMEfl/jX67jX6slAZ+QztF4OBNlxm1AEGUJ
         V12/0ncXcLnC36Qpq7GvBdTvJKMve6wOjV/HurYjFDSX+0aNDuM5/4hJWKeOvygZW+0V
         GTZA==
X-Forwarded-Encrypted: i=1; AJvYcCVK/UWBdn4mE/5MNOErUooo6b5z2mInlqJ1/GGnMHOlgDqoz525pIFERbj1M/HemJk00S8LHtbQOn0jVR453XBdDEhnYCKbw3cRuw==
X-Gm-Message-State: AOJu0YxzhxApG9tZgSykUhaVvk8UB2lJM9iQMUaVbrmuAUsAyYNGVT4w
	vrbOS24bHFu5QDC9+76MjvmZTywyewDFzQU0qlpqf0728QNEzIXnVW2iM9oM8LLkxEfxWv3vgGM
	HYQ==
X-Google-Smtp-Source: AGHT+IHVuhaaP+AqJkLOnP2nm2zoMNpTnmJWMLB94vD9m0Y86WTHHHaebaE0uZUg+d3sb7uwTDEgx3Svrng=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:102a:b0:df4:d6ca:fed0 with SMTP id
 3f1490d57ef6-e0303f28704mr13386276.4.1719241334515; Mon, 24 Jun 2024 08:02:14
 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:02:13 -0700
In-Reply-To: <545135fe-adbb-bf95-5b60-0646a76afaef@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240621134041.3170480-1-michael.roth@amd.com>
 <20240621134041.3170480-4-michael.roth@amd.com> <daee6ab7-7c1e-45e3-81a5-ea989cc1b099@gmail.com>
 <545135fe-adbb-bf95-5b60-0646a76afaef@amd.com>
Message-ID: <ZnmHeGU29F-iFeNl@google.com>
Subject: Re: [PATCH v1 3/5] KVM: SEV: Provide support for SNP_EXTENDED_GUEST_REQUEST
 NAE event
From: Sean Christopherson <seanjc@google.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, Michael Roth <michael.roth@amd.com>, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	x86@kernel.org, pbonzini@redhat.com, jroedel@suse.de, pgonda@google.com, 
	ashish.kalra@amd.com, bp@alien8.de, pankaj.gupta@amd.com, 
	liam.merwick@oracle.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Jun 24, 2024, Tom Lendacky wrote:
> On 6/22/24 15:28, Carlos Bilbao wrote:
> >> +/*
> >> + * As per GHCB spec (see "SNP Extended Guest Request"), the certificate table
> >> + * is terminated by 24-bytes of zeroes.
> >> + */
> >> +static const u8 empty_certs_table[24];
> > 
> > 
> > Should this be:
> > staticconstu8 empty_certs_table[24] = { 0};
> 
> Statics are always initialized to zero, so not necessary.

Heh, the whole thing is unnecessary.

	/*
  	 * As per GHCB spec (see "SNP Extended Guest Request"), the certificate
	 * table is terminated by 24 bytes of zeroes.
	 */
	if (data_npages && kvm_clear_guest(kvm, data_gpa, 24))
		goto abort_request;
