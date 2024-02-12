Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879FD18646
	for <linux-coco@lists.linux.dev>; Mon, 12 Feb 2024 10:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707732046; cv=none; b=iWcmBqrzOj3zEv0gbOXL4E/pjV9JLtq/TOK/6Ey4OMJvU/cqoDJYipRhJV0sLbcHzO8Pa4rm1MhP6tI+rrFGoXd3yJ13IYRSJMTQaXaFzSJ2P8eTGAjVsRk5hMYJuIhE/TuqQqrGylK0G/wGHqA1TviYS90eCQqkLKbNT6FgnpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707732046; c=relaxed/simple;
	bh=3y4L/Ww9jOlNtiXvABcrsz/8FFXP25E4KZgEUZ8G8fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ap+8czmppofmNEadUTRY3nj6lNZk84cMYmClgfO6A0acWORqN6fO1xoQOBODj9g6REgTTGZkDd9XMdpdtAltQb0eU66fs5pvokNW6+8LY6DuWtnZ3ldmt4iBa3MsiuUBdPC/Oa8g6CmkC8kCOm0KsCEYt0tp3rYmQHOcOKEJIvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hWBBIB7/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hWBBIB7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707732043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l44duX4bruiSysv390/0MeGikPC351P53LEkSBBfAnE=;
	b=hWBBIB7/621ZVG9VT3UfYAdBfBnA2gx9AL1Km+C3zXSY5THvIhJFnpNXpmQoOE/42bLRdA
	C3eeIuQxW+A84Dzl1FfB1gjtQ3qCLP3NZHz3qijUMjVrHXVgTP2NjmJ3zMvOfMv5EL8A9I
	gutsC0ZoVs1oRKZBM170UD+UHmZv8fQ=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-3l1EKrrqPcuHOqwKoyS-Bg-1; Mon, 12 Feb 2024 05:00:42 -0500
X-MC-Unique: 3l1EKrrqPcuHOqwKoyS-Bg-1
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-7cee1755d80so2285967241.2
        for <linux-coco@lists.linux.dev>; Mon, 12 Feb 2024 02:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707732041; x=1708336841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l44duX4bruiSysv390/0MeGikPC351P53LEkSBBfAnE=;
        b=pkscuuvm72APDc55WDhxCSuEP17Z/vK0FTLHyDHD4o3ynd7HFtEquqnkuxHLxh8sqm
         pdDcEtb+fZr+a42E8e9fI9vozwl5YkMeJ2/78KLKNREIF73ssZbb/KITZ9AL1GtsX9jn
         J5knKwun1FtB4X2hrJDQCozJ9N9bJHtXwVpgUsKmp0GIa9GEO7b0O0+ir95eqwwxK4de
         1YbFMotP46EMrTx2BU230HHgCYaTCrYrfPSf7meQ68/KKLjmMXB5EdZ/6lf+YOELW0Vn
         E+IVDuHck97I53ZXcHT9E601XlQQKmubR/T2smCRo1g5Euy9yrc0/sYHwFL+xSdtCjAS
         6aoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJXlkr/kUIap+CwlY2O5hHGgVEdwEn8srnQaDmRnsKWNJ1PnLgLrg8hDQfakby2uKFtuUkphtSX8qVg6gqU3Y4RmTqgnC8AnLESA==
X-Gm-Message-State: AOJu0YxJvI6MyUykz2hTwjFK2J81sLsY3a4QP2/U3frCSEkGuE7LHcz+
	+6tHMk9chSBE3QS8emJieWawSvzeXyj3hBKjEhHIYiy8jxP854FBQgVr70l1i4DtmMlHPBqHKCB
	y/ziONCn0xQ5sQeEfL8E32zxyZmmpzzaKkZbDMZDLqcT+sn21RS/vJ1r/iRvq0t0N2AmjYCxZIH
	hxoMpPuIhnuikyxnnvflzFIGzeV23E/D4w/Q==
X-Received: by 2002:a67:fdd9:0:b0:46d:162f:a77e with SMTP id l25-20020a67fdd9000000b0046d162fa77emr4229780vsq.16.1707732040099;
        Mon, 12 Feb 2024 02:00:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNS2UrbWm61NEj4QS+lNMC4rXIR1d7f9tSEY7SuWQz9LtNYOaIt21AdO+LQgIosdUlO16W/y6MTDYLoVqP5+o=
X-Received: by 2002:a67:fdd9:0:b0:46d:162f:a77e with SMTP id
 l25-20020a67fdd9000000b0046d162fa77emr4229749vsq.16.1707732039543; Mon, 12
 Feb 2024 02:00:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231230172351.574091-1-michael.roth@amd.com> <20231230172351.574091-7-michael.roth@amd.com>
 <ZcKb6VGbNZHlQkzg@google.com>
In-Reply-To: <ZcKb6VGbNZHlQkzg@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 12 Feb 2024 11:00:27 +0100
Message-ID: <CABgObfbMuU5axeCYykXitrKGgV5Zw-BB843--Gp4t_rLe2=gPw@mail.gmail.com>
Subject: Re: [PATCH v11 06/35] KVM: x86/mmu: Pass around full 64-bit error
 code for KVM page faults
To: Sean Christopherson <seanjc@google.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, zhi.a.wang@intel.com, 
	Isaku Yamahata <isaku.yamahata@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 9:52=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Sat, Dec 30, 2023, Michael Roth wrote:
> > In some cases the full 64-bit error code for the KVM page fault will be
> > needed to determine things like whether or not a fault was for a privat=
e
> > or shared guest page, so update related code to accept the full 64-bit
> > value so it can be plumbed all the way through to where it is needed.
> >
> > The accessors of fault->error_code are changed as follows:
> >
> > - FNAME(page_fault): change to explicitly use lower_32_bits() since tha=
t
> >                      is no longer done in kvm_mmu_page_fault()
> > - kvm_mmu_page_fault(): explicit mask with PFERR_RSVD_MASK,
> >                         PFERR_NESTED_GUEST_PAGE
> > - mmutrace: changed u32 -> u64
> >
> > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> > Link: https://lore.kernel.org/kvm/20230612042559.375660-1-michael.roth@=
amd.com/T/#mbd0b20c9a2cf50319d5d2a27b63f73c772112076
> > [mdr: drop references/changes to code not in current gmem tree, update
> >       commit message]
> > Signed-off-by: Michael Roth <michael.roth@amd.com>
>
> I assume Isaku is the original author?  If so, that's missing from this p=
atch.

The root of this patch seem to be in a reply to "KVM: x86: Add
'fault_is_private' x86 op"
(https://patchew.org/linux/20230220183847.59159-1-michael.roth@amd.com/2023=
0220183847.59159-2-michael.roth@amd.com/),
so yes.

Paolo

