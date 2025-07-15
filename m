Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A371C860A
	for <linux-coco@lists.linux.dev>; Tue, 15 Jul 2025 12:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752583667; cv=none; b=AXPoiY8kuLk370rWn56mLGdqR3jjWmT16bJuBCowFNz5G5XKbGITDvSBLCMDmw5sgLhBscLFOqqMDxgNPD4Lj273Oo1Ad/RfJR1uAQlujm/+W/QFZe0jYnI1F9yP9E7uff8WGQ7w4qEcNKKchJbFkUTiUlGAGIdUyLOOOlzhzbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752583667; c=relaxed/simple;
	bh=KYR+8WGWnfv9Y8T8MKK6057v1ckaI5RFw4T5Nl9bG3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7LjRowAm58hKrvITAAU3C0cy+/eTwvkrKctzHledxam5ot1r0ZoVxJpuzjiYQVK9jLorDN0LYQCJXO0vcpu81H6MH1f14FB83M41iqF88TSrFYtZs20ygiLdwr/ABGZS8BRO/tjH3UUrWl6zbX8aXLyKGXkCEdyf4Gt0fbjDvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H0jDEVeE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H0jDEVeE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2357c61cda7so118955ad.1
        for <linux-coco@lists.linux.dev>; Tue, 15 Jul 2025 05:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752583664; x=1753188464; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aj7ubsCPwZOZJpEqxVz8TbpdGSsesLgcauIRtiEwO7k=;
        b=H0jDEVeEzP4pn2pokvomCUpvHeyGrtJ6IcNjVtR6OwJNnEcHzVF5gbFjeXLgBFMQmi
         3oLNYQioLVygBEupDGpq1t73p98EyEkDF8oUw/bNu9q1N2Czbdqon6+ggRKYJEudjceM
         ei4EEnDl4gPy6QN5SMSyBTfgprCAI4v45KQNGwoXNoNy1IxwERnpPWjN/Ry0qiKoRL1u
         Hg27BI6eiVbXdYa90ps6If/J5kNIH8Jy85et6RC5G4TnZJlMebD9XcypIpxo+1WIxmme
         XUmUloo+p6ibXD6pKHdazNHGlDmr8CU4D25HogQuo8nlBepZKC46kHS8Ic9hORWqmva1
         HHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752583664; x=1753188464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aj7ubsCPwZOZJpEqxVz8TbpdGSsesLgcauIRtiEwO7k=;
        b=TK9F2km9OlJbaMvY7xVTKRe4QdgR4AJHChmR6/jz7ZMxvLjgZ50Fiwp5NcoxZSenJ/
         kVDOIdpTM7yFriKkw0mB9FqBvJHJL9cIjWmzti/phHBBmW5RzFZyIIw6U1dELMNRFu6M
         qFSPqpEO0+L591nf3W+WTs7ABI1Lp1r4YzeKfbIbPP7f2pQiSXgl4mLCqTeR5VtjXoIR
         vLIK0GkEoldkNycW9lj516hP/BvJgE/mjAiwISSesqvSJSMpvfokJiflF7YY40mXrEvH
         82zRVYsLXQZM5VtgK8GuIZzdSJfnrVHer02lb3JH3qg6ZI08Uz5TSrco90QKDIvmFNoR
         E5Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXQM3BC8raMw6EC8R97adhEIK1PvrcMVQTuuT96p23STo9ZlJlpRQmQd0NwrB3NTjib+8rX7orBMpS3@lists.linux.dev
X-Gm-Message-State: AOJu0YxzjFCfD7/VkwBevet846pfAMhLqHmPDXrpw15g9/6NYUwbwtzz
	wllfnJ+PH+jwwpfcfwJPCBUg0U6ArcQgdsOeW+juVmPmXZkfmFypSN1Tn8hS6LXN4X8QuBDU1xt
	aXi9d2Z2PhGmzi9J2m1T2rn0h5rR0yZ/pPJ5MnXGq
X-Gm-Gg: ASbGncu8i+xltSTeWHNbUVmjJGsU/oXA6fG9tgq3oj36XFetHv9s+OzzkTguXk1vTlz
	U09q8Cl/GRxjXxXZ3zfbUaPn5nWI/sHghEeGZJMKTLDi0A8LNfvaBOkeVcY3ZwNJwG38v0+jxqF
	pCs9kKQneK68camauUHWBizEa2DXaTcYUmazlzTJn7dg5KHqGtceFI9CYKn3q1awiWBuC6X45Mz
	1vFIdMqDZk8096YIEPIPIXQJYsuA6q8H+gUD0o=
X-Google-Smtp-Source: AGHT+IH6FhoFqjhts9hPrxy/0Fq8QGuoieFjS6j7sof9NlS1UqMiOBs9T+m5042HRhsk8TgMmcHFmjT0Kfqpm1cbk+Q=
X-Received: by 2002:a17:903:185:b0:234:9f02:e937 with SMTP id
 d9443c01a7336-23e1b55fab4mr2002615ad.25.1752583664056; Tue, 15 Jul 2025
 05:47:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250613005400.3694904-1-michael.roth@amd.com> <20250613005400.3694904-2-michael.roth@amd.com>
In-Reply-To: <20250613005400.3694904-2-michael.roth@amd.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 15 Jul 2025 05:47:31 -0700
X-Gm-Features: Ac12FXzMu1OlGDkOTawp9sA6enrjnahYfgISzdZFft1Fez6ANKUKFtOIvoCuXnQ
Message-ID: <CAGtprH-vSjkNyQkdqjgnqkK7w0CM2CbewxTwq0XBOXkE8C1WvA@mail.gmail.com>
Subject: Re: [PATCH RFC v1 1/5] KVM: guest_memfd: Remove preparation tracking
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@redhat.com, tabba@google.com, 
	ackerleytng@google.com, ira.weiny@intel.com, thomas.lendacky@amd.com, 
	pbonzini@redhat.com, seanjc@google.com, vbabka@suse.cz, joro@8bytes.org, 
	pratikrajesh.sampat@amd.com, liam.merwick@oracle.com, yan.y.zhao@intel.com, 
	aik@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 5:55=E2=80=AFPM Michael Roth <michael.roth@amd.com>=
 wrote:
>
> guest_memfd currently uses the folio uptodate flag to track:
>
>   1) whether or not a page had been cleared before initial usage
>   2) whether or not the architecture hooks have been issued to put the
>      page in a private state as defined by the architecture
>
> In practice, 2) is only actually being tracked for SEV-SNP VMs, and
> there do not seem to be any plans/reasons that would suggest this will
> change in the future, so this additional tracking/complexity is not
> really providing any general benefit to guest_memfd users. Future plans
> around in-place conversion and hugepage support, where the per-folio
> uptodate flag is planned to be used purely to track the initial clearing
> of folios, whereas conversion operations could trigger multiple
> transitions between 'prepared' and 'unprepared' and thus need separate
> tracking, will make the burden of tracking this information within
> guest_memfd even more complex, since preparation generally happens
> during fault time, on the "read-side" of any global locks that might
> protect state tracked by guest_memfd, and so may require more complex
> locking schemes to allow for concurrent handling of page faults for
> multiple vCPUs where the "preparedness" state tracked by guest_memfd
> might need to be updated as part of handling the fault.
>
> Instead of keeping this current/future complexity within guest_memfd for
> what is essentially just SEV-SNP, just drop the tracking for 2) and have
> the arch-specific preparation hooks get triggered unconditionally on
> every fault so the arch-specific hooks can check the preparation state
> directly and decide whether or not a folio still needs additional
> preparation. In the case of SEV-SNP, the preparation state is already
> checked again via the preparation hooks to avoid double-preparation, so
> nothing extra needs to be done to update the handling of things there.
>

I believe this patch doesn't need to depend on stage1/stage2 and can
be sent directly for review on kvm tip, is that right?

This update paired with zeroing modifications[1] will make uptodate
flag redundant for guest_memfd memory.

[1] https://lore.kernel.org/lkml/CAGtprH-+gPN8J_RaEit=3DM_ErHWTmFHeCipC6viT=
6PHhG3ELg6A@mail.gmail.com/
