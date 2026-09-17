Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111984B44C4
	for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 18:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789670478; cv=pass; b=cym900O1C9WgXL6KDDYzhSYpXxz2Mfwc+4fs7fte7otcbRvm6vzGDppHcaG/J8oWenOboFn/0OV61Tv9IgbeT1T7SQUjKQFT+9i68k+yeUkCnTYD2yffs9Wuoj00GEqBJRJtmjHSzGgRuHR1eM62xaThj6Q8XGypJ0cTa89PSLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789670478; c=relaxed/simple;
	bh=scck5hHT95K37qHw+esH5ZRFCW0/ES6LCsTDUaeNHHE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1SdPFHFU1vKzqEYHcn156qWX7gdYc/pkdXs8F+lzGwaC3e367Z3wD9My9pAtTzd2GhoEVEe8EP4hbHquK4qslHpBCT2/GgQviZbyBXbpN9t6IcuAYH9KT2BxH204IfprKHFTvBxgw2J9eFfKfBg6cWgoa5gxXCOlF5Pmr7HrEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D3G9Y2Di; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D3G9Y2Di"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530fa0716f6so13507181cf.3
        for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 11:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789670476; cv=none;
        d=google.com; s=arc-20260327;
        b=RBQv2P5iUUu2kWS1vXInv/SmHojTrcfyJFFm11thhW+l8zVUXzkNTV5y0U9ffeRI6G
         gJEHUtQfx+topGs9ICIbhJl2xJhj6iDjxKDxk1LbyIhxXr7R0c4NnEvqb+Paed918alg
         05yZKMnkgz3/pt1XgZQ+bs2P7mEgzcV+1I5UHrQcx9qaO8B6EYDtOiQEQVa3OybartdP
         VVgD2j4MEhGyeDdN6YGW86pAptVPnOd/a27T+F2qqCMPFZMTM+cwlgrM1gnjlABuK4sd
         O6yYNdfH10UrFv+GTnxdk5uEasgVs8sWvosFkrrWclhuJUUnBgwdb+fnFViUtkjKtphY
         DA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ELY/Vg+05/1vgJL6X13+cNWxT0fSTrqi1KeBJiACBOk=;
        fh=+RwcziUXpchMPSVupkY8WBj7/vT7BsK416aDrkAeBBw=;
        b=funH0DSvUGxwnOsUHlq4r4oZoJOAiBw/FAzCjBIPmFMEYrFTG7ZbLRqsggRDbATc6O
         egCfpPlu/n8SS34ZtOZhZUmmElMH1YeifT4yduUhg+kWpo3KGq+6dnceBsPnqej4tkaN
         RIutZWETUOTGF1KS5f3xf4wi6Fuv279XTRy9mju2cU1Dc4kKrNlvTnZ+NVlaf30gjsY1
         BN72x9xdl1YCanKePQodxCYBPXo742m4/cQtQzcVptuy23uR4iaAV2uG5bCNBlOYDNFe
         uMRzm3g4AwxhpswZ2MAeNCEgMtCpVRYG4+yHA8HaOXGtoZrrZ6jhKs1tFy697niN4lpR
         r/ZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789670476; x=1790275276; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ELY/Vg+05/1vgJL6X13+cNWxT0fSTrqi1KeBJiACBOk=;
        b=D3G9Y2Diy5cY/hymGPwRkA+vU61lvkoKiHkGAYRHSTmbCbef43QvBL5uhlCPjGUfHQ
         TvJ4druLbDnTNqjGSx6UXZUBh6E3Uxi6LC3rCax2aK/Jyvv96hcG3Mz+I48iizeJP8Oe
         ISgRo3mYlRmr5yKSKdkuVIRtxR8yREQwdrKvt0pa7y506o0wnm4HjKCdIQPiwBoXo53P
         m40A+MvQSfBmbeJE2bNFoKsSyfgUSJxT6qje8iyh05AOQRz8YK2Snhr3zr+dajsxdlD0
         6o3Y3MavEAVoNlHnhsRTJIqWWqP54/bSAgdJchR/Md06dHU1anF/8/Zw3HOjVB7Rb+zT
         C9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789670476; x=1790275276;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELY/Vg+05/1vgJL6X13+cNWxT0fSTrqi1KeBJiACBOk=;
        b=cTkSJKpfbJQLd9Rtu0NJpZTfqubxcWizI5Qz53uQLUYYsAkt9BAaR0zclMYWMxXFeU
         tvaRZiXEgS8LbMrBuaMAhDxhj5DycREPXlfkP38DG0u4EZH/kJLPeHyzG+sTBMMlarC+
         inQU2ltKp6colNkgFQQqyiXQjnX3r8GBPCDFagnxjPZRc5RHHGLtjIqyoMMz5bNzuoat
         633iRiuxlPg18ecPiuCWzmNp3wZjbL2tW9vRcWS7vhl49lzisb//FpyP2xiZ6ntvLy08
         5B6OxTlnJampx3FfWUzWQw9AQldiv0MtqAQW/WYgLsWqvbA8ZcA7ovsOBZXMKX3AfyZw
         Xjpg==
X-Forwarded-Encrypted: i=1; AKwUvBxgbteGp7dUdbfvQFeZDbgP+Rs1cpNakrhnmqcOU9FhLXeTOMWJX3Ta2vw66cW4heJhoLiodWIwo++P@lists.linux.dev
X-Gm-Message-State: AFuF++nuCQGKOaGk4SjZ3wQbtoXqfpx4fOMkjP+wpgeuHTUKexRjKEg4
	MPhZXkeDuiLfG7sa5m3zboUhW/88o4KpYw5V9cnReOyrXFSeJsSpBfHkVNq+CRkzp2jP9XN1MnJ
	T92wpUlgvWHMkVK2FzSgkuCW6XCXWXIhmdM6b1XBM
X-Gm-Gg: AYBFou3ecYYu1fBk981V1ql8V3zVt2RlTHAHBOVDORmJsR353wVULdbG5dz7dqXzuwl
	w1ShIs5OCcV93GCJSjuvuXjWzWzARrL+CshUY0Jic251hSpiDF/s3qTFIcEgYd5KwNTCZQ2yQZe
	2lz471N1PNcvudL0nCBl3hTnf3W61eia6ZDtjDYztPEAiwKny5WLTng/Pin40e4EQ7wRCuMv0Cx
	9EHYN1u4ptKmTiombMDwpkJzGQDArOGgFGb+6FNJ3eVVg73cSsVszFtm6EYRpui358BP0SyzfQy
	Jb2gYV7iTkWwQERJaPc5xxEIrUild3pym0g1vN6a2OQRoCTnAFv2Tembfg9nnHleH+6nUrvj7wE
	kdKIUqiZH8VJrxiZyuODIFB5td5QpADZr1QjiU0XGKTNrUYYGGPNT
X-Received: by 2002:a05:622a:6090:b0:530:b2e2:903c with SMTP id
 d75a77b69052e-5329e3d0db2mr1678821cf.60.1789670475157; Thu, 17 Sep 2026
 11:41:15 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 11:41:14 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 11:41:14 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <16ffff40-4ef0-4312-a700-348603f05c0c@kernel.org>
References: <b91dbfae-20f1-4b9f-a25b-4397afae80f9@kernel.org> <16ffff40-4ef0-4312-a700-348603f05c0c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 11:41:14 -0700
X-Gm-Features: AcwNN1VH2wWa1-by0xZw2bG7z5QRI7gmGmYcIKbpxNe1NiOi-7X0KO0Bg2xGucg
Message-ID: <CAEvNRgGW_VHmT82q+bUqHh_5G2Z9sUF1jJOTiVN4Z8_cA9A50g@mail.gmail.com>
Subject: Re: [Invitation] bi-weekly guest_memfd upstream call on 2026-09-17
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	KVM <kvm@vger.kernel.org>
Cc: amit@infradead.org, aneeshkumar.kizhakeveetil@arm.com, 
	ashish.kalra@amd.com, dwmw2@infradead.org, eberman@quicinc.com, 
	fvdl@google.com, gshan@redhat.com, jackmanb@google.com, jackyli@google.com, 
	jthoughton@google.com, kalyazin@amazon.com, kas@kernel.org, 
	kevinloughlin@google.com, liruxin@google.com, michael.day@amd.com, 
	michael.roth@amd.com, mike.rapoport@gmail.com, mvaralar@redhat.com, 
	pankaj.gupta@amd.com, papaluri@amd.com, patrick.roy@linux.dev, 
	Peter Xu <peterx@redhat.com>, pheragu@quicinc.com, pkondeti@qti.qualcomm.com, 
	prty@google.com, psalian@google.com, qinkun@google.com, seanjc@google.com, 
	shan.gavin@gmail.com, shivankg@amd.com, sidtelang@google.com, 
	suzuki.poulose@arm.com, tabba@google.com, tatashin@google.com, 
	vannapurve@google.com, vbabka@suse.com, wyihan@google.com
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 9/16/26 17:11, David Hildenbrand (Arm) wrote:
>> Hi,
>>
>> Our next guest_memfd upstream call is scheduled for tomorrow, Thursday,
>> 2026-09-16 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.
>
> Sorry, tomorrow (17) of course :(
>
> --
> Cheers,
>
> David

I'd like to try and restate the conversion problem we discussed today to
understand better :)

CCA's conversion protocol is:

1. Guest tells RMM to convert a GPA range
2. RMM notes down, in a vCPU object within the RMM, the conversion range
3. On re-entering the guest, RMM tells the guest if the conversion
   progress, something like:
     + success, GPA start to GPA end was converted or
     + failed, (with some error?)
4. Guest can
     + Be happy that whatever it requested is fulfilled
     + Retry to finish the parts that wasn't yet converted or
     + Be sad that it failed and figure it out.

I looked more into it and I'm surprised that what I was thinking of as
"tell RMM to mark shared" isn't even correct.

RMI_RTT_SET_RIPAS() takes these parameters: rd (the realm), rec_ptr (the
vCPU), base (GPA start) and top (GPA after, or base + size).

RMI_RTT_SET_RIPAS doesn't even take anything about shared or private!

RMI_RTT_SET_RIPAS() is actually saying "host permits the conversion from
base to top", it's not telling the RMM what to set it to, this is also
different from SNP.

Interestingly RMI_RTT_SET_RIPAS() also errors out if the current
shared/private state is different from the one tracked in the vCPU
object in the RMM? Did I get that right? I'm looking at the base_align
Failure condition, where it says ripas_pre != rec.ripas_value.

If two vCPUs race to convert the same range to shared, both vCPUs would
have rec.ripas_value = private. The first conversion would be fine, but
the second one woul see ripas_pre = shared but rec.ripas_value = private
and would definitely get an error?

And there's no "accept" step in the guest after conversions, which makes
it different from TDX and SNP.

Difficulty in using current gmem hooks that SNP uses:

* .gmem_make_shared() called from conversions doesn't have the vCPU
  context, finding the right vCPU context is expensive.
    * Sean, don't we already iterate vCPUs to find VMSA pages to kick
      the right vCPUs?
* .gmem_make_private at fault time is too late
    * At the next vCPU enter, the RMM would already read it's state to
      report success/failure, and there's no fault in-between for the
      .gmem_make_private to happen.

At the call Sean suggested mirroring the RMM's tracking in KVM, but that
sounds quite arch-specific and it's like doing arch-specific validation
within KVM.

p.s. Fuad, for pKVM you also mentioned that you'll need to check if the
guest had requested for conversion first? This might be the same/similar
problem.
