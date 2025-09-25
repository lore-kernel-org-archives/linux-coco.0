Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEF3274B4A
	for <linux-coco@lists.linux.dev>; Thu, 25 Sep 2025 13:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807899; cv=none; b=J93N7tix408uHavx60WVK5v1trvMtgIV+gKOiAQr8gz3nEfEr9xqZ1CEN++np1NqJLd3BgcKSIkiNLs9RnIRcgH+yeeS1KfU4No2S7AiuPWnvnWFwO8Y1D565WHf9ATtmoj7CXee0IDZM8kmSqQsBiakJpS8C2oTdvNs0tOe+zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807899; c=relaxed/simple;
	bh=Z0F6rvv+vHHHgqN2/7WrnWaBdoTfLfsx+4E1sr2dpYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIwlnq1m1dA580Q8eRa5tmqJDpM79as+4i3CJMNxRkWS31zeA69WqA4BdMmZ52GRf6662p7SNGGYW5JU6Ahff6E1jvcQXnBqoDo4dC8Hx/qoERB9ufW6u6Ai7Y8Erq+jW2cnOTHKgjZ5rwYXiJZHep+Y8ZDHuY3eqiqRVg/zEgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mWGhDgBa; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mWGhDgBa"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4bb7209ec97so1147311cf.1
        for <linux-coco@lists.linux.dev>; Thu, 25 Sep 2025 06:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758807896; x=1759412696; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N5TRZaIKsL5BDWNX1fB2oE8143OJVf1xWjoYHdxo8R0=;
        b=mWGhDgBa1HMImIkWbkP+hzWi96ffYc0+BkfxQBgZUAcL5pSVzY/PskLG/71E3Um0E5
         jM+iRW/sHJGpyyg6xX4OKJzgL3Hm9+3CxHbU9PC/z6CTB260i360OCXWGXZ690G6NUL3
         8H1zeOFFRAw7TlUMDoefRoRZ6oiP37xxdzvLd14hlLCz2SILTOTfgV7/Gqd9ypazWxm4
         XMsiGCsAJBw3/Iyq6FMUhYxaeC0P485/AsnlZB1I7dGJeqQgagIi9BZSN6J2tXQ6wdYk
         yv57zJV1g5QxUmK3qCyqP/5ENoOW/O7t7FG3Sav3WS3h5tYfg026bDFoEugVsuKEhNo0
         d1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807896; x=1759412696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5TRZaIKsL5BDWNX1fB2oE8143OJVf1xWjoYHdxo8R0=;
        b=ekPCZ4ht1LgL0bpL1t5gnbYaXDDM+KFtG5lFK6dhh5YwZHftBLiSNSxLvIt/HVNcfi
         2pxSn1O7SzksUne7qEBHwR3a1AIz33yb25djgCJG3ZOXbOTA1hCzAsDHzS9hhQXVaWy7
         6URvI4S0mGVFrYA+xWT4/4Y2jYku7Ay54WaPwnzJBc8qEcY9O/FRb7vUdCF3BF9WCTMi
         gaKFOpDFTwP3vn2lgtmtDVBMOk2yYoE0Nqn0D6RrCT5ytppypMwEdTGzrMJJOhvHxZ8h
         H7JukmZ18NEtC2M/wBp7kP02JI7rmM2x9ETiUVsNWMXc2YszKPllSaTsGX4zCtRRp0kb
         f41Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2WniA/cXwEhZ8BQ5fQjzsK2vJH8f0H40x0wPcqe8q3VjiyvlqBCuhkQvdoZ4UeEUuXkS8gFT0pF92@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5haHwZg8QQJgnOS6/XCxjy6EwNYEh0CqOIOMmutM7Vcfp4gfs
	+bKL+PmVpqwPb2Jx0UtIaTWqI4qrPBNxdO8tlHIKTzg7qySexVWpWgGCQEfswD6PJc5OBaokBr+
	e47oonCVZ2BcGeSysWUA8IuZ7pnFEew5e2NYbkIUV
X-Gm-Gg: ASbGncsyUSn0aPmNwLQcv1ymc/4SFTqlLbGJoA65n4YCuPskPXf5F7ey8DTJxiueB55
	c5GRTh14rSAYq95ezISHG8xpxql5Ug5uB4PnkVxwG7HkWfKR3rpFr8iwUBOyOeCzrgUg92JCbo8
	Eb5QcNVpQ+xV7eode/VkmstZKq8zMtLZKw3xIVaaUFr1tTtSP1fmFZGK2Vqg6ntN2mZEaV1vxpy
	84db0WsZhuMi5o8eGabZdD4nQ==
X-Google-Smtp-Source: AGHT+IHMjlzJoU4go98o9OLI3ONqf4XSyVwqhgPkrMYYKQ3q5Z+I56IySJAtT5Z6pWwXAgA4n71MeTiHJXaU1zjAWA0=
X-Received: by 2002:ac8:5996:0:b0:4b6:2d44:13c4 with SMTP id
 d75a77b69052e-4da2f12a974mr6481551cf.10.1758807895145; Thu, 25 Sep 2025
 06:44:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com> <20250827175247.83322-7-shivankg@amd.com>
 <diqztt1sbd2v.fsf@google.com> <aNSt9QT8dmpDK1eE@google.com>
 <dc6eb85f-87b6-43a1-b1f7-4727c0b834cc@amd.com> <b67dd7cd-2c1c-4566-badf-32082d8cd952@redhat.com>
 <aNVFrZDAkHmgNNci@google.com>
In-Reply-To: <aNVFrZDAkHmgNNci@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Sep 2025 14:44:18 +0100
X-Gm-Features: AS18NWD8QPp_e9025CtzHt-1GmqDfc-4KC-skp25M5mSn0nTsRNLyfZiLblKLT4
Message-ID: <CA+EHjTz=PnAOdjaPuHRnXE+CTUHCKVSnf-LA6bgwKpWbapy_0Q@mail.gmail.com>
Subject: Re: [PATCH kvm-next V11 4/7] KVM: guest_memfd: Use guest mem inodes
 instead of anonymous inodes
To: Sean Christopherson <seanjc@google.com>
Cc: David Hildenbrand <david@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, willy@infradead.org, akpm@linux-foundation.org, 
	pbonzini@redhat.com, shuah@kernel.org, vbabka@suse.cz, brauner@kernel.org, 
	viro@zeniv.linux.org.uk, dsterba@suse.com, xiang@kernel.org, chao@kernel.org, 
	jaegeuk@kernel.org, clm@fb.com, josef@toxicpanda.com, 
	kent.overstreet@linux.dev, zbestahu@gmail.com, jefflexu@linux.alibaba.com, 
	dhavale@google.com, lihongbo22@huawei.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, pvorel@suse.cz, bfoster@redhat.com, 
	vannapurve@google.com, chao.gao@intel.com, bharata@amd.com, nikunj@amd.com, 
	michael.day@amd.com, shdhiman@amd.com, yan.y.zhao@intel.com, 
	Neeraj.Upadhyay@amd.com, thomas.lendacky@amd.com, michael.roth@amd.com, 
	aik@amd.com, jgg@nvidia.com, kalyazin@amazon.com, peterx@redhat.com, 
	jack@suse.cz, hch@infradead.org, cgzones@googlemail.com, ira.weiny@intel.com, 
	rientjes@google.com, roypat@amazon.co.uk, chao.p.peng@intel.com, 
	amit@infradead.org, ddutile@redhat.com, dan.j.williams@intel.com, 
	ashish.kalra@amd.com, gshan@redhat.com, jgowans@amazon.com, 
	pankaj.gupta@amd.com, papaluri@amd.com, yuzhao@google.com, 
	suzuki.poulose@arm.com, quic_eberman@quicinc.com, 
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 14:41, Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, Sep 25, 2025, David Hildenbrand wrote:
> > On 25.09.25 13:44, Garg, Shivank wrote:
> > > On 9/25/2025 8:20 AM, Sean Christopherson wrote:
> > > I did functional testing and it works fine.
> >
> > I can queue this instead. I guess I can reuse the patch description and add
> > Sean as author + add his SOB (if he agrees).
>
> Eh, Ackerley and Fuad did all the work.  If I had provided feedback earlier,
> this would have been handled in a new version.  If they are ok with the changes,
> I would prefer they remain co-authors.

These changes are ok by me.
/fuad

> Regarding timing, how much do people care about getting this into 6.18 in
> particular?  AFAICT, this hasn't gotten any coverage in -next, which makes me a
> little nervous.
