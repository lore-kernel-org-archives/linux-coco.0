Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FE6268C66
	for <linux-coco@lists.linux.dev>; Tue,  8 Apr 2025 11:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113259; cv=none; b=IxKca+oy1TQaV6yLK6V+as66yf0amZvcSs5rfd8jEZJZN2K9t7DDeoexfedSBgCi7lsui4LrI56r1BfN13mNqx4QzBHf1nexDrQieEGmYL5RZcSLs4PY4YReAbfApB0aiLViU+1iiROkBR30MDQxrDKFS2rBmiHU4u9ChKAHVdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113259; c=relaxed/simple;
	bh=ofPYs6O/D31jfLG0JAc5s7o+o56RtFffcyvSz8UayLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=it5qTX3bBL+SGN2OMZzwGo14Ts1V6fxURCiZP38ZKW4g8NmIzPVRXWS4LxQgph8Yn9Xdqqx/4ENEXzSSxNw8COI0oMvNY4IpwolgKBjPGY4aa+seUleM9LcUz/tUYJdgMd2AJDjzd6GVORyOeirD0z79AqIMONh+i7qcgIcOJAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LW0MlNZS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LW0MlNZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744113256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6P87msgsabneZYPN6rB+5xYdoyhBToIEhxgNQC92Q0c=;
	b=LW0MlNZSfo0Aoh5GjSfQ3nq19zCKaibtI/D0T8H/gGtafmLilgI4QhwrDlaufzfFrFDZvp
	bN6tRViYLstxIQSJ6WBnfbcxE7q3v5tpfNQQ4X5PvULP60WSatmjprkczgq8i2x4+F4903
	QJkGf1PnGswblySXpySucnQtigeQlxo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-zlG8CEY1OyuUiv5UV_jUtg-1; Tue, 08 Apr 2025 07:54:15 -0400
X-MC-Unique: zlG8CEY1OyuUiv5UV_jUtg-1
X-Mimecast-MFC-AGG-ID: zlG8CEY1OyuUiv5UV_jUtg_1744113254
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so45670955e9.3
        for <linux-coco@lists.linux.dev>; Tue, 08 Apr 2025 04:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113254; x=1744718054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P87msgsabneZYPN6rB+5xYdoyhBToIEhxgNQC92Q0c=;
        b=p/qVosMztpgxZuvUTdcYMbmsqRxncpC4fJwRFkjB6fBdPNQmJX7ijaMBFhPtHGjfID
         pQ3O1IA8rgH0lbOVfMkZEwN2h4k5HcgKGkTcItg/sNH1fkIAVjGd2dv+55j7G54dTJZY
         ZCCGI9Wo4Flvl/mm4QqD2UIYPCfFYez51rj67ihQdAstFqnkjnPaeUjp46iaebkfrbFy
         rhWjb6w20GzCciqAYZ/CsD4eVXMdNMl4vU+cbzH9pj1u2OIMso4R5OAomqe97PwklLT2
         TnwGQlK9i1tw5KbZ9oME/03e6Qbr+vosSbd6+B0hSrVDRZPUCgt0X0D7z24gXLhGpy9H
         9QOg==
X-Forwarded-Encrypted: i=1; AJvYcCXm2X5mKIhOi94Sp8TZ3ziX5m6LVAWlC8XnMsMt+SW+/yrLT9aSwhbIDIZQqIcrAMczaUPbPlp/FP1E@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9z3Wb1adsr4MkpvrxnRK7uPTBDRQGhaE1Mr0mZGLtx+GUecUH
	EMXVg7xraJdems2JM7xbuFTkRglymkz6SoWMSW3YDYkOFtHxvsGc6xtlEknKt7s5hzKjKDm9z6Y
	TcbG5txSldBNg1YQI7+oIyqJ8lYS+Gj986N+PeGmUykdw7k/ZFEeqy/Xk97E=
X-Gm-Gg: ASbGncsTRkmomwfryX68lNK6MRSY7U3NhJEoU2pUq+eDgvv7Fl4CgeAclQAuz93GiQN
	ASEJojFbycKGmmroxo9L5WE+Qog0iQfkpyh7FgG/ag2UAXUC8AEWlI4cCQC+x7gpa7eyAxZv7op
	szqBcBcD7IlYkRn5rv7pc2CyOqdJGRqAP87qDHZj2rxmmL0aC8gd0Mwo5Y+DWJA4KesX5pZbiim
	SMjtoq1/dA2LcK6+iMj17HGu48FysQshM34ErmTO8YbU2inlXNXbsK73bEZKzavMBp1AywvEucb
	RyykjuMsd0tNAobZFO1hSBryy9S0DKmWe8uMAgjbriWt361hF2vaHw7ArLzxUn7n
X-Received: by 2002:a05:600c:444b:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43ecf8f2a65mr147387335e9.15.1744113254081;
        Tue, 08 Apr 2025 04:54:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEazQZYy/ewEWuBTBgdQvEiXuTOqwdRTF+asTjWk+ZHtpNHgb+bGQ0L75gwnYyXxYjdFSFI4w==
X-Received: by 2002:a05:600c:444b:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43ecf8f2a65mr147387035e9.15.1744113253632;
        Tue, 08 Apr 2025 04:54:13 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm164679105e9.0.2025.04.08.04.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:54:12 -0700 (PDT)
Date: Tue, 8 Apr 2025 13:54:07 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev, linux-integrity@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Joerg Roedel <jroedel@suse.de>, Dionna Glaze <dionnaglaze@google.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	linux-kernel@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 4/4] x86/sev: register tpm-svsm platform device
Message-ID: <o2u7p3wb64lcc4sziunr274hyubkgmspzdjcvihbpzkw6mkvpo@sjq3vi4y2qfl>
References: <20250403100943.120738-1-sgarzare@redhat.com>
 <20250403100943.120738-5-sgarzare@redhat.com>
 <20250408110012.GFZ_UBvOcEfEcIM4mI@fat_crate.local>
 <eqtiiphs6rtjo7nirkw7zcicew75wnl4ydenrt5vl6jdpqdgj6@2brjlyjbqhoq>
 <20250408112820.GBZ_UIVPp-LuIiVrIV@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250408112820.GBZ_UIVPp-LuIiVrIV@fat_crate.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MmVBntNMxL2HjdSftlQoogkD-tMfqYYcli_2x7IZARs_1744113254
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Apr 08, 2025 at 01:28:20PM +0200, Borislav Petkov wrote:
>On Tue, Apr 08, 2025 at 01:08:36PM +0200, Stefano Garzarella wrote:
>> We discussed a bit on v3, but I'm open to change it:
>> https://lore.kernel.org/linux-integrity/nrn4ur66lz2ocbkkjl2bgiex3xbp552szerfhalsaefunqxf7p@ki7xf66zrf6u/
>>
>>  I tried to keep the logic of whether or not the driver is needed all in
>> the tpm_svsm_probe()/snp_svsm_vtpm_probe() (where I check for SVSM).
>>  If you prefer to move some pieces here, though, I'm open.
>
>Yes please.
>
>It doesn't make a whole lotta sense right now to register a TPM platform
>driver at one place without even knowing you're running with an SVSM inside
>the guest blob or not.
>
>The usual approach is to register upon a successful detection.

I see, so IIUC I can just apply the following change to this patch and 
avoid to export snp_svsm_vtpm_probe() at all, right?

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index acbd9bc526b1..fa83e6c7f990 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2702,8 +2702,10 @@ static int __init snp_init_platform_device(void)
         if (platform_device_register(&sev_guest_device))
                 return -ENODEV;
  
-       if (platform_device_register(&tpm_svsm_device))
-               return -ENODEV;
+       if (snp_svsm_vtpm_probe()) {
+               if (platform_device_register(&tpm_svsm_device))
+                       return -ENODEV;
+       }
  
         pr_info("SNP guest platform device initialized.\n");
         return 0;

Thanks,
Stefano

