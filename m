Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D7418FDB0
	for <linux-coco@lists.linux.dev>; Wed,  6 Nov 2024 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730907223; cv=none; b=mCPNnb+tfXgqQRBGoksw6GSY60HheE5UQ+L1HMqVv0ccC8uCrHDI0nmKMbfOtN0bpBNQ63GXmYuhs59qnndBXeYJhrjae8xSY+5blNcTKTDZj4uqtXK83/W7XU7S4muc7kL4MPOzhzopburp5jOR985m701YvNE6tb7QU4A7Uro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730907223; c=relaxed/simple;
	bh=k1NdnFBYDmk/2sLKQou7a+3F3Yfiy+QnQFhVpLZVRv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oRsdpYIpCphl77Mue7skMtDXF2S63z8k67wimITYXL1Msezt+Du7GyNVBXstn3kxmSZmCAuCvniPrjNi5IG+cEaUwOKtQ1QUovHB9WbID0MuIrlSRSPe17P/YeRsga2nEZZl9OXZU+LTsEHOLyQmfLbxux5T2fbFfyVAVYg/cNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NAymjr2U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NAymjr2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730907220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3b9JCpSj3w1t33bq9PIcme+Xt7egQV1HagqalNhg/8=;
	b=NAymjr2UyvP72BE6KKbJ66FA3ejyB4TGURnZ1l/+6mbUyK7gncS1DxEM5v6WUvmTwUgDHS
	U1zPCZlfCJQw0OWigzKHCRiUkWHqtTbttsw0KspEwE6FnGPXF5CBXmOdTpBozv24N1kMMF
	YD/iJtunrfIdXhZjyp4tETFEAghTqQQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-NV4Voue4N3qGQ0PYwhVvLA-1; Wed, 06 Nov 2024 10:33:37 -0500
X-MC-Unique: NV4Voue4N3qGQ0PYwhVvLA-1
X-Mimecast-MFC-AGG-ID: NV4Voue4N3qGQ0PYwhVvLA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d5ca5bfc8so3401612f8f.0
        for <linux-coco@lists.linux.dev>; Wed, 06 Nov 2024 07:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730907216; x=1731512016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3b9JCpSj3w1t33bq9PIcme+Xt7egQV1HagqalNhg/8=;
        b=wxl9BFc2Ls84f2jQ+GPM5t4ZXM4f614QvT6cmpMuBGzNGDf7pXqRBxWeaOyNy9WiO6
         kUMwAIRIRfnU1+DK/GY4cAwzk30JIhWAkMuRld6YpG95KW2kn+roeP73TiRg0HgWnD/j
         atGHUD9boIKg5CaV/X6P6Om1WXuvwk+hY0fdNRYFbWmDlIvGDG8+mDQZCr2+YU3kUj0V
         CigAfcIczUTRPtyaiFDw3A2nnECdo74yZk9LBiPOfsauJN6F8aFsVJp051+4rXFq5xjO
         g9KtnMGS47I2505HEuaOawIqQENOh+50tvbMYwXljkoV+pXk8aeNHNlOHDowRIZ3ResD
         NKmw==
X-Gm-Message-State: AOJu0YzUpKNzLh3ADZnjoUzMe2GkF1Vs57HTTSLHFN14LM104GGd4aK5
	lRnQr73BKmyoXJu/NevfGOO643zIi3Ix1LW3Ma8vEB2RxoA6XWUOTYlr4jZJ6FZ9Xm5tucQ8fPQ
	P40dc3EEWfbBiQYFddpNcmVTsGyOVTet34hv8xqVorvKjPeWdLpF1C6kN4v0=
X-Received: by 2002:a5d:6da7:0:b0:37d:4870:dedf with SMTP id ffacd0b85a97d-381be782c4fmr21195903f8f.19.1730907216055;
        Wed, 06 Nov 2024 07:33:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBfLVubE8ma68+WqYznVtgfNH9P30JGhDfY9F00Ioa612tcBGm9NbMwwNSxCrHhr8zxS06KA==
X-Received: by 2002:a5d:6da7:0:b0:37d:4870:dedf with SMTP id ffacd0b85a97d-381be782c4fmr21195856f8f.19.1730907215371;
        Wed, 06 Nov 2024 07:33:35 -0800 (PST)
Received: from sgarzare-redhat ([5.77.86.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116b575sm19242508f8f.108.2024.11.06.07.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 07:33:34 -0800 (PST)
Date: Wed, 6 Nov 2024 16:33:29 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: linux-coco@lists.linux.dev, cclaudio@ibm.com, osteffen@redhat.com, 
	jroedel@suse.de, Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [RFC 0/3] Enlightened vTPM support for SVSM on SEV-SNP
Message-ID: <5wkkddbt4celh3gutg2mpykuky3jzzlk5txyadhdsslxdjqjt5@zzimrp4hntcb>
References: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
 <hcttb7s5yvur5oigge2xlbspyi26ngrgc4unn7ewv6px6vgukv@mp2relslhh6w>
 <124b138ba19fb0e6bf82b09be1217b8d5d829018.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <124b138ba19fb0e6bf82b09be1217b8d5d829018.camel@HansenPartnership.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CiOl_OqffUs461Upe3qeXR-W75FbR9z_PjhEXeRdiLA_1730907216
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Nov 06, 2024 at 09:54:15AM -0500, James Bottomley wrote:
>On Wed, 2024-11-06 at 12:19 +0100, Stefano Garzarella wrote:
>> Hi James,
>>
>> On Tue, Jan 03, 2023 at 04:01:33PM -0500, James Bottomley wrote:
>> > This is a sketch for how a fully enlightened vTPM driver would
>> > work. The idea is that the SVSM responds on function 8 to vTPM
>> > requests, so we use that to send down a buffer which is modified on
>> > return (the buffer must be big enough, so the agreed protocol is it
>> > should be a page in length, which is larger than any possible TPM
>> > command or response).  The protocol used is the MSSIM one which is
>> > self describing in terms of length, so there's no need to transmit
>> > sizes (it also leaves room for expansion to localities and
>> > cancellation, which is useful in the light of discussions).  A NULL
>> > in place of the buffer is a probe and the SVSM call simply returns
>> > SVSM_SUCCESS without doing anything.  This can be used to probe for
>> > vTPM support because any other return would indicate no vTPM
>> > present.
>> >
>> > Hopefully IBM will publish the new svsm-vtpm repo shortly, but
>> > we're still working with the old CRB based one at the moment, so it
>> > may take some time.
>> >
>> > The three following patches are for two different repos.  Patch 1
>> > will apply to any upstream Linux kernel, Patch 2 requires the
>> > non-upstream sev-snp repo and patch 3 is against the non upstream
>> > sev-snp edk repo.
>>
>> Thanks for this series, I'd like to restart this work and Claudio
>> pointed me here.
>>
>> IIUC the last version we have is the one in Coconut [1] which is
>> based on this series, but with some changes on top from Claudio to
>> probe SVSM and check if TPM commands are supported or not.
>>
>> I already rebased them for 6.11 here [2] and we will include them in
>> the next coconut-svsm branch, but in the meantime I think nothing is
>> blocking us to upstream them, so I can take care of Linux patches,
>> while Oliver (in CC) is working on the EDK2 patch.
>>
>> IIUC the only thing missing from the patches we have in Coconut are
>> the fixes to Don's comments. Do you have a branch or patches with
>> them already fixed?
>
>What are Don's comments? Did you mean Dov and this one:
>
>https://lore.kernel.org/linux-coco/f7d0bd07-ba1b-894e-5e39-15fb1817bc8b@linux.ibm.com/
>
>?

Ooops, yep I meant Dov's comments (exactly that thread), sorry about 
that!

>Sure, but I thought Claudio had already addressed those? I can take a
>look to see where this is, but I haven't been following closely.

Sure, I haven't seen those changes in the Coconut branch, but they seem 
straightforward such that I could make them if they got lost, no 
problem.

>
>> Otherwise I can do it on top of the patches we have in Coconut.
>>
>> Any other things to fix/improve that you can think of?
>>
>> Let me know if it is okay with you that I will restart working on
>> these patches.
>
>The original was pretty simple: a platform TPM with a single
>send/receive and the implementation inside the SVSM call code. I think
>the only real change is switching from the msr method of calling to the
>ghcb one, which it looks like is already done (or at least indirected
>to the proper snp wrapper routine that does it)?

Yeah, that part should be fixed in the Coconut version since we now call 
svsm_perform_call_protocol() that should handles ghcb/msr IIUC.

Thanks,
Stefano

