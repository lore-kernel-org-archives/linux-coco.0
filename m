Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552DE1E5B70
	for <linux-coco@lists.linux.dev>; Fri, 21 Mar 2025 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742547688; cv=none; b=r7MKYJ3vLXhhYqB/ZxduL7CwkoSeDBxP663bW0vdbg+lHqS5xEDY9ku6F8S+/pxXqbJDpwUQ7EsbMethKWlbD9JD2G4Gx5hxccJebfP0+on3xnenDy9mt/dATFb8qp95wBBvBKvm84D3+aDeKLGy2xWFLTC0/kNiRM1nFWf48QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742547688; c=relaxed/simple;
	bh=sD61hq3NbhxezVFYNQMHc6yPU40zBPjZnQBfIAHwJ6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KUl4jtULQFRkkCvQtJewsazOL+4bI9BQWJTujI4Wd3nAjRnL8J5+jZF/ZSyxrROew58KRqNMBhcbhxrfbop+FnrBfs5HtkhCZVotVx7iRmSwCRcHcdnRN49pJgNw51in4SHTs/CGMbcZ+X8BCqwBDQWO9LVb7h0G8TpoAg1zJro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TmQxIjNQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TmQxIjNQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742547686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FmxTpqzZ0HZCDGZEFV/pcObjt3lzP/3kzdelw6nLCTI=;
	b=TmQxIjNQx4pwOjZ9w7DMw2UmkQd6XqxYVHBMCkmeTt+xNQv5LF6y1PZH5xp24lJxQP6sou
	iGQYGnozSgqY4Co3/Np4W5Ats+GGx6995jTYtsm/srQVFa27gfyiAPtRYsGPpsixZBHnd6
	7h5MMnafeEOzTRwpl4iA+284sMwxUT0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-9zGQ6jQbMnabohLTkTTbWg-1; Fri, 21 Mar 2025 05:01:24 -0400
X-MC-Unique: 9zGQ6jQbMnabohLTkTTbWg-1
X-Mimecast-MFC-AGG-ID: 9zGQ6jQbMnabohLTkTTbWg_1742547684
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac3d175fe71so140291066b.0
        for <linux-coco@lists.linux.dev>; Fri, 21 Mar 2025 02:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742547683; x=1743152483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmxTpqzZ0HZCDGZEFV/pcObjt3lzP/3kzdelw6nLCTI=;
        b=UDQu2Pvrnjk6Ahza7R97QJ/9Sr3DysH2uqUQxXj23oFgkdynrHHkrGcgZ0TEsP4bfB
         mYP2iAOJJ6UVT9wd6JHgRa2qgLqpouyzxEUTQ1CqixQnzqFq+gK3I+My58f9NXCnmNz7
         vzQytW6/1u87aQb8GmFwKF0KBlBU2ZwbSWwXyNs0SP9VWgW733qbUgcPVTzMYpE3TMoT
         c89H6+Xl2T+EJ6OiWZYLPL3EhZIbcmcpeSe1w+aD2jvZvIy19qPM0G4XmtYmzyDqzAr1
         LjbtpesZBjmVCgGQ7z3+YnIdPH2pglDEsmiaTuNtc+ZYXEiuw9qkHxheXegLMU36DH54
         ILLg==
X-Forwarded-Encrypted: i=1; AJvYcCVSmqb58K+hnQmcqPPWf63sLHcViYQPqEm/YsHNwC1qFUk5Bvhp0VB8CvO6h15baE1a1oZ0lU4Q1W00@lists.linux.dev
X-Gm-Message-State: AOJu0YwQVszqQ4b4MHyi9M5hoGUz7RtbFvBZ8LkjnT7uMxHblIR9Lbs7
	hFnrzfbBmk3Jn1ppuo7/ZvauqFTdxVHb3F+GytgV87K6g3AOSLx/nJyuGZhuVGucBj69oMuuM7i
	u/7e+57hXQPsZNw2QLw/ANT60MFUYctUv8ffsq8uzlexodbomYOCCmy59rrQ=
X-Gm-Gg: ASbGncstubF8Hhan94iRottkH8Q1q7tYapAA1IQFaRGf5rnMihbLdIAMXAf1jbqE+q8
	gI6S2FLbqDJldjadgKuyqt5nlNwkySFx9eHJcMeaHOrUZa5WVfyRIfPOGdWZwgQBLBLRzdT76nK
	gxGhZc6qB6iBhN4zVwlNoQvd1IKUxMf8m0hqKkPVuxQ65ETiK44WWeYIpBBKVvM9GWnP1XINKAd
	tuZTd/xBeTKu9+eSBrfDgWWz647lEN7PMULd+Dg26TChGRAvS/0lC8+dnMc+6TxW1LaH+58u0G8
	UU9PJ71wQZ6ffgbY2omS4BP2tiKDOSVAPXmhSMvr8SoaZ6StMBqhw2K1E+NyInr/
X-Received: by 2002:a17:907:971e:b0:ac2:622f:39c1 with SMTP id a640c23a62f3a-ac3f20f3e88mr195018866b.22.1742547683314;
        Fri, 21 Mar 2025 02:01:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWCLFs66okYwfxdtv5GcgcdWwR8ZJt//AkHzaDeJko0ra/kue35fF/YS12dNXFy2WPXsVuiQ==
X-Received: by 2002:a17:907:971e:b0:ac2:622f:39c1 with SMTP id a640c23a62f3a-ac3f20f3e88mr195011766b.22.1742547682576;
        Fri, 21 Mar 2025 02:01:22 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8e50edsm114444066b.52.2025.03.21.02.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 02:01:21 -0700 (PDT)
Date: Fri, 21 Mar 2025 10:01:17 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	x86@kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, Dionna Glaze <dionnaglaze@google.com>, 
	linux-coco@lists.linux.dev, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v3 1/4] x86/sev: add SVSM vTPM probe/send_command
 functions
Message-ID: <rspkz663fg7i7jomvg5ehv3ldr6ayehttb7vgwwzsfsxafzb5y@uhqcadvsmw6f>
References: <20250311094225.35129-1-sgarzare@redhat.com>
 <20250311094225.35129-2-sgarzare@redhat.com>
 <d7e5a1d2-5fcc-bf7f-a67d-7871a1627c98@amd.com>
 <Z9glWp6U6vyEmKQa@kernel.org>
 <7kuhiyy7gj4py323g5n2vy3ddlg666zwhtx3mjcklebgtlstdc@xgdyeecifwei>
 <Z9wuLVeP726Cssqp@kernel.org>
 <20250320171619.GOZ9xNY4W54avW2a-u@fat_crate.local>
 <Z9xQw8QpRKk26G6R@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z9xQw8QpRKk26G6R@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZnM2uJUBw5l3R8EH4PVCoY66cBdoxQf1T2aKh5eSlGU_1742547684
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Thu, Mar 20, 2025 at 07:30:43PM +0200, Jarkko Sakkinen wrote:
>On Thu, Mar 20, 2025 at 06:16:19PM +0100, Borislav Petkov wrote:
>> On Thu, Mar 20, 2025 at 05:03:09PM +0200, Jarkko Sakkinen wrote:
>> > > I can do that, I slightly prefer BIT_ULL() macro, but I don't have a strong
>> > > opinion on my side.
>> > > @Borislav since you suggested it, WDYT?
>> >
>> > Either goes for me. Sorry for nitpicking that :-) The first comment
>> > stil applies.
>>
>> Bit 8 is a lot better than 0x100.
>>
>> Let's give a better example:
>>
>> 0x0000000008000000
>>
>> or
>>
>> BIT_ULL(27)
>>
>> :-)
>
>Sure, I'm fine with using BIT_ULL() :-)

Yeah, we all agree :-)

>
>>
>> While I'm here: I'm guessing I'll route patches 1 and 4 through tip once
>> they're ready to go and give Jarkko an immutable branch he can base the other
>> two ontop.
>>
>> Agreed?
>
>Works for me.

Just a note, patch 2 adds `include/linux/svsm_vtpm.h`, that file is 
basically a translation of the AMD SVSM specification into structures 
and functions used to communicate with SVSM in the way it is defined by 
the specification.

I realized that the file does not fall under any section of MAINTAINERS.
How do you suggest we proceed?

Should we create an SVSM section to maintain it, including the TPM 
driver and future other drivers,etc.?

Or include it in other sections? Which one in this case?

I'm willing to help both as a sub-maintainer and reviewer of course, but 
I would like your advice.

Thanks,
Stefano

