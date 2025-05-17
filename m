Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA99553BE
	for <linux-coco@lists.linux.dev>; Sat, 17 May 2025 00:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747442260; cv=none; b=grzCU1xq7ZhX7fzU9FeFGf7sk8djHw2zKGlmT9q5nnQD6zTVldQ7svVjSo2I6QVVNfEc96wfug8v7sQijofeTty4r0ukggV2LmItpUzLGIsEc6kXs0FHH/5XbL5IRAXKjSwN53MQwPgxhnbZX2EEkV0PQ6i3FuKdw6OIiFpIO8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747442260; c=relaxed/simple;
	bh=5QWqpt8UQT+7sGjaLvlYOPslmVhHfwIca9fRx8275Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbmpQfL1qShVk2RtohRHauRzG5AhFeSJhi3DzI+t+RoxXI5rMZhhRUBnMRPQh3CZoRveVvGgU11y5mHJAFoZGX48WHC5ZtApRPIYYDlafBMMNrzpvDgVKVAjQBL+4LfnsVgpESzGuL3Uu+jWZ3/1+E10uMPCr8/+T7cP467+61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vAdSs6tZ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vAdSs6tZ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74248a3359fso2871118b3a.2
        for <linux-coco@lists.linux.dev>; Fri, 16 May 2025 17:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747442258; x=1748047058; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GGBS69GTPI2RAKvmYg8FGeQcpbc48jJia8g8c3mkVTE=;
        b=vAdSs6tZJYaiYoEfZuS0rmO0CAfdxYZxmIBOxsnG/YpzzyUAjff7zr8CJxJ11Uh+NT
         x+GftMpvOlFhLz+QHYwpdJvIkhjkDD1fG9jbep9z8gYujcd9p4NpQ8Xl7D1pI8kMThNJ
         1poc6gheI/wk8KpUpqByeERCajvleY6xyauHcNcVv9e+9Kj+/7LYDcDo8U8aSLSYUNCl
         wdw28KHStDrO7+AXys8h5xcxf+3ej3D2WkpBG0betINghOfrnQn0QkjmOw3cf1gJ7EYu
         HiVrsF31SS7sd872iNQO80yiJ3CTuHboVNe40I8bPDuI7Kd8+kQXUcd6rf7AT5dD4Zlx
         A4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747442258; x=1748047058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGBS69GTPI2RAKvmYg8FGeQcpbc48jJia8g8c3mkVTE=;
        b=A2u/z4KJ3WLK3RdsHuxQ/2Vc+g0Iw6N+kuEz67lBn1ugDdv4eZTE98NXhGR172IZtn
         fJMQdgzJCtYd+2PyZFzGFRsNX7/dlPc/FFrGlQ47G9n1qmvtRX3eUpKri3ssTFfXiHhx
         5MKEuurE0engvzuVYPTG862FwTmuqBWMH17ah+wUgrRVwHRTOARj80HzAXFH8SI5bmeG
         HuBrg00hlyKfzejnY/B4BAVXChI77TZnYEyizf1iJvrluab+UFcCYqajKxPMpvOVZiy9
         WUSk6kGVWkW5EH+2Ww/9+1U4iIf55/lW0j+XR8pzRP7t8NzrDyfo3hBjJINqZTNaHtvh
         h5hg==
X-Forwarded-Encrypted: i=1; AJvYcCW151d47/ygZ6is7F2/nM66IZOGAi/Yj0gZneoJiQrjmep0ru5+LD/7ogwjdEnz72qnsyH2xgHMZof0@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf3s/pyc43JE7Ihn5eCj/CwLyaWAJFZ4n6dNwNPITDSQNQRnHx
	VCHqfoPquf+PPoHLVuvnOr/NW/R6jB8hPoQt0VZmzopkMU9Pv267bLjMJ2/C9UjJtdVYQGbm7t+
	2Y51L7B+jl+2oXKf7n0mWVxDKSjJ+oBmpPk5IwGa5
X-Gm-Gg: ASbGncuW9slkfHG0wqQADjh70t3M8Os8ruLn/pDOZw2gjG+8NDd/Nu3XdnVnhWsFztk
	H/20XVUwN432D/aq0PCuNHfDgLuMjbc1PxuKTdBP8MdqP95FlqqKJu+HkqnmQdukpMj88tWEGdm
	PejvWNLCpOQt3PjZ8urmEkmWwKBbNw5+VORg==
X-Google-Smtp-Source: AGHT+IEw6yv27A7ypvZUsX54CsMfyWQh56U8kZL5hyzUNYgeL0+XsFUYBvlDzHmNtXxZGuv43oWXWL4xM7ruRZ33L1A=
X-Received: by 2002:a05:6a21:9188:b0:1f5:8754:324d with SMTP id
 adf61e73a8af0-21621875a26mr7295097637.9.1747442257679; Fri, 16 May 2025
 17:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250515220400.1096945-1-dionnaglaze@google.com>
 <20250515220400.1096945-2-dionnaglaze@google.com> <aCZtdN0LhkRqm1Vn@google.com>
In-Reply-To: <aCZtdN0LhkRqm1Vn@google.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 16 May 2025 17:37:24 -0700
X-Gm-Features: AX0GCFvqpnmmIdGRZ0Krupreoa4zV8101M6bKqT1JZaaQ4QUjjDWnxQ2I5c7uTA
Message-ID: <CAAH4kHai8JStj+=HUiPVxbH9P79GorviG2GykEP7jQ=NB2MbUQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kvm: sev: Add SEV-SNP guest request throttling
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, 
	Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"

> > @@ -4015,6 +4042,12 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
> >
> >       mutex_lock(&sev->guest_req_mutex);
> >
> > +     if (!__ratelimit(&sev->snp_guest_msg_rs)) {
> > +             svm_vmgexit_no_action(svm, SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_BUSY, 0));
> > +             ret = 1;
> > +             goto out_unlock;
>
> Can you (or anyone) explain what a well-behaved guest will do in in response to
> BUSY?  And/or explain why KVM injecting an error into the guest is better than
> exiting to userspace.

Ah, I missed this question. The guest is meant to back off and try
again after waiting a bit.
This is the behavior added in
https://lore.kernel.org/all/20230214164638.1189804-2-dionnaglaze@google.com/

If KVM returns to userspace with an exit type that the guest request
was throttled, then
what is user space supposed to do with that? It could wait a bit
before trying KVM_RUN
again, but with the enlightened method, the guest could at least work
on other kernel
tasks while it waits for its turn to get an attestation report.

Perhaps this is me not understanding the preferred KVM way of doing things.

-- 
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
