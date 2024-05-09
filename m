Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3EB14A4F5
	for <linux-coco@lists.linux.dev>; Thu,  9 May 2024 09:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715246384; cv=none; b=gs2CRQKefHbfhVuzfyZRKx4p6qmYxUxCepCjRD1gH6tOluENZS4UIF9Gy1KG5rSzUrspNtQjoGkh1r6Wkye5tI/69HycauGnurMzWsMKi/nH6rg+XMa/xghFgByASE0weYu9+a+cJ8jzTn4NaCUUCSZd27Tjj/bVSTlGQtHFNQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715246384; c=relaxed/simple;
	bh=jmevKMrzeJi5mvBgez98VR78gzPQTQVp4irn0sMKTDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RA+EZQoePoDioPI6T8wyFi/e19Qq7G53kaook2exRC3E2fG0n/+PFQxKtGSnme2JKrgv7EHYWIZMs/nQwl64LJdaBFfkKJI3zAlENBW9hYC6rpMZLpYJezYLLM+rYXIxaBiJGqLuH0s/8Q4h616qwqGlyiIgMxgR7cFXetO4HrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UgczYuyB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UgczYuyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715246381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7vMs94siUkMQ0Z1b8w6GKdXPEsrvSAFnIe75Ff7i9K4=;
	b=UgczYuyBueQ8GahjpIsZ6loRjIDJDb3ozNvPHqel5T0ArG5ySTGLefRjVKptYDbFvbFgku
	mGCHwjWquCphlVWD/l/E953dAjGXmRMbX5QNLQ9+g/1Z/Jbis43HElEpNBT+5jywS0gh/6
	5ET/Yz3nroDh6Q7oVxYBjtx+gWMNLIg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-FA7lb3ltPTSkzx-axZ0LDw-1; Thu, 09 May 2024 05:19:40 -0400
X-MC-Unique: FA7lb3ltPTSkzx-axZ0LDw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-349cafdc8f0so364362f8f.1
        for <linux-coco@lists.linux.dev>; Thu, 09 May 2024 02:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715246379; x=1715851179;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7vMs94siUkMQ0Z1b8w6GKdXPEsrvSAFnIe75Ff7i9K4=;
        b=Z4wg0//NQv4f0jeyNso4oM2Le0gjNHy8W7WmELxdPGiDWrvQDV7ozCsI9TKZCvwXny
         h5k4zOR8oeItUJvZnCMvKxrr3WAGs+vVjyZVaYsy5K1KVnJIMgNwmWiPpCPuxyl+CBAw
         JeiFBOctsJjcVx7+KHAYWszVfgXQhukCt/sQHuCmQ/UQ8TbDVXZ+nCRzwhHQJnHZozNJ
         ptyh7kKwgadGGbk4uoQy+OtGI2rVt/TaGA064w1TZPOmy4eke4lJlyPrF7/Tm/oRU7SX
         tiO3yw042XiUaUFW6+NborafjFwQQ1G56IO8asYDOyJKNU9VpOKz9yQKW9bmCTRBDCmK
         IFkg==
X-Forwarded-Encrypted: i=1; AJvYcCV6x/FXnwr9mRHVFZkE5KQNch7rEOGLityYMXyVDiv4zRlsn0Zl7CaSrNU+z2D0+ZJlflDimzioAv1FjW3FOrjRy5MwamtWBYstzg==
X-Gm-Message-State: AOJu0YwrgPXIWgUpFbPkhf9efOSzmSHvfUFcoAzrDsfSqFApYOsSlCkd
	El9H4E8VefNLSl3PwgB33BinrnrXDpXHsb+L7uiAuT9ZPFebbiv2Cl3zXbgqsEyFG40s3nxRIwL
	VnYdV1tZtCjWI3b6aRfpftNozwL4hgFaDknJ1odVIDJ47cshWoceBaBeJ2iIXMJ9zunDyNiXV
X-Received: by 2002:a5d:4533:0:b0:34c:72aa:6fe0 with SMTP id ffacd0b85a97d-34fca241368mr4389963f8f.18.1715246379028;
        Thu, 09 May 2024 02:19:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJh3SuqH3yNbzIZYnYk688DTBqYlucoBOzYmZ3Dv4FrnmITUrIQUfykuQrafBaMOakQpi/Zw==
X-Received: by 2002:a5d:4533:0:b0:34c:72aa:6fe0 with SMTP id ffacd0b85a97d-34fca241368mr4389931f8f.18.1715246378646;
        Thu, 09 May 2024 02:19:38 -0700 (PDT)
Received: from fedora (g2.ign.cz. [91.219.240.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a8454sm1172307f8f.56.2024.05.09.02.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 02:19:37 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Alexander Graf <graf@amazon.com>, Ashish Kalra <Ashish.Kalra@amd.com>,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org
Cc: rafael@kernel.org, peterz@infradead.org, adrian.hunter@intel.com,
 sathyanarayanan.kuppuswamy@linux.intel.com, jun.nakajima@intel.com,
 rick.p.edgecombe@intel.com, thomas.lendacky@amd.com, michael.roth@amd.com,
 seanjc@google.com, kai.huang@intel.com, bhe@redhat.com,
 kirill.shutemov@linux.intel.com, bdas@redhat.com, dionnaglaze@google.com,
 anisinha@redhat.com, jroedel@suse.de, ardb@kernel.org,
 kexec@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] x86/snp: Add kexec support
In-Reply-To: <c2732461-e768-4356-82ce-a80c73997f02@amazon.com>
References: <20240409113010.465412-1-kirill.shutemov@linux.intel.com>
 <cover.1712694667.git.ashish.kalra@amd.com>
 <26b3b3b5-548d-4ebd-9d21-19580a41e799@amazon.com>
 <87msp8mmpq.fsf@redhat.com>
 <c2732461-e768-4356-82ce-a80c73997f02@amazon.com>
Date: Thu, 09 May 2024 11:19:36 +0200
Message-ID: <877cg3fil3.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Alexander Graf <graf@amazon.com> writes:

> Correct. With IMA, you even do exactly that: Enforce a signature check 
> of the next binary with kexec.
>
> The problem is that you typically want to update the system because 
> something is broken; most likely your original environment had a 
> security issue somewhere. From a pure SEV-SNP attestation point of view, 
> you can not distinguish between the patched and unpatched environment: 
> Both look the same.
>
> So while kexec isn't the problem, it's the fact that you can't tell 
> anyone that you're now running a fixed version of the code :).

...

>
> I'm happy for CoCo to stay smoke and mirrors :). 

"Only a Sith deals in absolutes" :-)

> But I believe that if 
> you want to genuinely draw a trust chain back to an AMD/Intel 
> certificate, we need to come up with a good way of making updates work 
> with a working trust chain so that whoever checks whether you're running 
> sanctioned code is able to validate the claim.

Launch measurements are what they are, they describe the state of your
guest before it started booting. There are multiple mechanisms in Linux
which change CPL0 code already: self-modifying code like static keys,
loadable modules, runtime patching, kexec,... In case some specific
deployment requires stronger guarantees we can probably introduce
something like 'full lockdown' mode (as a compile time option, I guess)
which would disable all of the aforementioned mechanisms. It will still
not be a hard proof that the running code matches launch measurements
(because vulnerabilities/bugs may still exist) I guess but could be an
improvement.

Basically, what I wanted to argue is that kexec does not need to be
treated 'specially' for CVMs if we keep all other ways to modify kernel
code. Making these methods 'attestable' is currently a challenge indeed.

-- 
Vitaly

