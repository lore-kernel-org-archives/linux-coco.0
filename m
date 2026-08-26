Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5F23EB810
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741543; cv=pass; b=p9cT24brfaujmx4NkhfMGxNDLPlvNtrxtBc81IMK8aqJi+zapu+ZPOjL+b7sm4I1dPXC78pML2cRZMh1FKH9SZf0DPZawDe8WVV1a05+xhBA4joSF8pPu54VizrZzxy7HAxpAQ/WCHIEhi9aMcYvzSne3AnsktIEPzr1y/il6kE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741543; c=relaxed/simple;
	bh=W+E2yob3VC1nC5T5vDlsuCeEoBLkoFNoqRZ0DeBs89U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qb/YMR3EK2groqew3MVNjdXc6RfG6whH4bPmYL3NwzDjpYJ+yF2vuFnt10pBeMG9kgx44soAh59qhvLMf6yHfesZW2qoOjY6dqTC7zG5mhTiMEggXIAsBYKvfSVaJGF3gkClzgvkLKno+li9I+ahNEhFoEelJbRTc1BBPRdSULw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=pylwx4oV; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="pylwx4oV"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c05dcdf49so8205531cf.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 03:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787741521; cv=none;
        d=google.com; s=arc-20260327;
        b=KNjnDrK1W9Jamwi29sI1L+HAwYOAi3OBUTP9kbWQmXz8U59lCq4inLQwDKIxv8lmbQ
         Wb/E1l0UpZQYQyXV9WQnHWVUFnL8+ihkZuU7S3YLGInM7ugUSF9gzIXtu5yukcPIuL6x
         gU/jGBls+3YGzdWjuGgobjNHV9pKSX47dqXFbRtDvrKtgrytZLNkzEJwzBlrmmPe07Ov
         2aIcxuSmZZAujTrv4dAqFXfiRRYTYZqnIrwDDWFKb87PhjcVIEPnuXp/ySNvd91+9T1F
         jNEMKwNIWXb2VO0uwq3ufTtTqeftqcq8dpX4XOfYdf0zO18D+bsI55DMS/QvA2oWzXaY
         emDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W+E2yob3VC1nC5T5vDlsuCeEoBLkoFNoqRZ0DeBs89U=;
        fh=Bdzk0Kkk5Ojl6PTqC1VvAEkBcOlJkrcJxaJjTEKswb8=;
        b=N17mFsnDEgSNJprWrh1WeJpQ1+YZb6co46xdT15qaSPxAxwqK/B12rWO4pP5Pyt+5y
         f6+x4lU+hOWliw0G1A5FMQScdYdAhzEXdqX17HkA8FHHXACijBHJamEJEPJITi1QYfBd
         shMWTSZvUUpBtPR2t7E9jWliqXCZUWAF7EpEiqQZym/F2ef1cjgv6brBxBUl5m7izfz0
         v/fu8e5Uc9fYEfHEjVxJAcMwk7nG3ZJXIgbxbikdXcapEuy+1+Led0FuPwqKgFwuL0fy
         QdXoMxmBC394vfWu3iJKVqk5u2CgHKAGRzFDOlGkbD+/hYHxpPIeZDMuDy/6beEscJmO
         pWqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787741521; x=1788346321; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+E2yob3VC1nC5T5vDlsuCeEoBLkoFNoqRZ0DeBs89U=;
        b=pylwx4oVD/7bi+F3pH58t2B/tljlABanfk8pR/CcPQxtOm2vFFirWBysIujutQpha3
         a4MD6lE+cPbltJWcYSfVtc4mRJbtgmP/ooE4J23X9EkudmkLXNXyEdpqtHZJH6gLGpNb
         I3mfjVsheQe0YGld0WvEeVr93VmEVAUHegmTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787741521; x=1788346321;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W+E2yob3VC1nC5T5vDlsuCeEoBLkoFNoqRZ0DeBs89U=;
        b=Kx7I3R9FyHqBTlUPgDuR+k0Kq/VY0x/Iks5SEhEAKmOe+c4YXNKuOnVqX2ehXh6Xud
         Ivz6w5ziKCmrly40oOxskcK+DI6+Lyub1vum0rqDnsZx3vrymgU8EiRvZ+bOBlhCtXzp
         09tzL0dDemFlfp3jWwHjDM73HMQYnfPBKH+g1O16eFh1yj8utcurJiebB7i3C9+wvPDD
         XBTDWJoTmj4GZAhL+SzmU0XdW+fNQ1AVKinsMJWNx9Sixnryuwg5nUbx+WSHGwqEORRq
         Jac3fhD/Ok+KY/BEyGTe2L5dzIXGm3IsCZh90uIUgdPCN4OwQcpEPvmzocWg+Q7ZEN8e
         f8zw==
X-Forwarded-Encrypted: i=1; AHgh+RqsWhPzLxlXLgfmc4LvOTKclEdy9vqrVnLimzk4CWq5z+VU1ooepmrlISMRMtXj/xoy0bvYGVdICbh3@lists.linux.dev
X-Gm-Message-State: AFuF++l0WATra89MN7FVsuKSRcXw8ocgIPYIF6vgMSe3gWrj3tWAgrFx
	iq+Sk4RI0u2UgkILSQLf418EhtfNCFThA0MARLYaPqIuEw+NTdyfIuAT0+eio+p0ZMhfq0VeXCz
	GlncOclCSmwMzuIM7C3lnwga04tRd2TOgRBk+s6ERJA==
X-Gm-Gg: AR+sD11BLVz5uSGdAbrn0ocoxPywq68etjIz6KosBJKincvmQ3GT9Y+1Kd6hj9Bllw9
	R36TOvDtMjav6s0aOKetLPmC/kt37Scbuy248aoWfRgj19W1aFgmnAA8nnsoFHnyNFDrlGAW74J
	/CjpJCFREICPegR0LUSSDAKOhnwx9v+awbxxoDIWYUlb95zuT0pqHrmX/nEw+1EPaK85sBYmW8P
	OREN4s0GeVXWm16nY9mCphYm3aUarWg1tEPkfL2NZK4v72iHzTEesAcZQivpy2y69ab9fVWQCdZ
	zD4tVOsr4ECjzkD+lCrGi+19WPJUbxISPsAjSFIN0MfZRf6/5lMt6QnM/aW9V9Im2TvohMFzuBq
	zfFM=
X-Received: by 2002:a05:622a:1192:b0:52b:6543:d8a with SMTP id
 d75a77b69052e-52e423205a4mr50624011cf.26.1787741515931; Wed, 26 Aug 2026
 03:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727210718.125872-1-psalian@google.com> <20260825175433.2588528-1-psalian@google.com>
In-Reply-To: <20260825175433.2588528-1-psalian@google.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 26 Aug 2026 12:51:44 +0200
X-Gm-Features: AcwNN1XetyIdhiAra5tdw_37A5FJQ5bKzyZQIMDhheeFgB1hN6l2gVmfLAojSAg
Message-ID: <CAJfpegsP62ZEddEY2Oh+SqOLngyztYkNEEK3W4rrvHRBXMFkyw@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: mark DAX VMA page protections as decrypted
To: Punit Salian <psalian@google.com>
Cc: pankaj.gupta@amd.com, michael.roth@amd.com, thomas.lendacky@amd.com, 
	stefanha@redhat.com, vgoyal@redhat.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 19:54, Punit Salian <psalian@google.com> wrote:

> Modify fuse_dax_mmap() to apply pgprot_decrypted() to vma->vm_page_prot
> when establishing FUSE DAX memory mappings. This ensures guest page
> table entries for shared DAX buffers are explicitly marked as decrypted,
> preventing memory encryption faults when accessing host-shared DAX memory.

Applied, thanks.

Miklos
