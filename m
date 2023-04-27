Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7975C23D5
	for <linux-coco@lists.linux.dev>; Thu, 27 Apr 2023 17:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682616008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPZaawwQwmja+K3dcGcTuaq8agrRF4dPj3IVyzF/XkQ=;
	b=PiiYZ0IwbSaJPJ1dvPYOEO5kBHVQDxWIR/54wuktOrE3lNddtkQbdrsDYlGj/hd/dDr+Ze
	4tliS9PUTIWwAQ0ycZutUphNxbASV7K6ByD+yeaDWmaeQ/emqqwtuQmWcuLP1M+RLy5Gp4
	P3b4vPQzYFBlkFg0AXVD2+pXFtm60A8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-uCywhuOoMIK-0fhn05uN0w-1; Thu, 27 Apr 2023 13:20:02 -0400
X-MC-Unique: uCywhuOoMIK-0fhn05uN0w-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f173bd0d1bso56144375e9.3
        for <linux-coco@lists.linux.dev>; Thu, 27 Apr 2023 10:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682615999; x=1685207999;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPZaawwQwmja+K3dcGcTuaq8agrRF4dPj3IVyzF/XkQ=;
        b=HKtHAzSO2uhTPYqpIy0Bucf9BRyxovXJEE+l4vHHwkSQesVpljQWwco55DmMbwzYfv
         16Q0ITwZk1kuuDkUTGZZlx0RqFN4NXBB3qSm+Lon6GNCmGxAvhqn/WyeL+mhgUh02izp
         UoG01cL5urgrTwGqpHlEQmMu643EI67qCHy99n6e4TuD1c3gNbqFqmGyBzUNBYY9dC6m
         DkxbTvdZtY2koOnT9EKA7q72vL5YzPH+LT8RZHl+AVqJ59H4z7AiLxSeZ1R6I60MIERl
         gnl2s9MjTUpbNmGZLEleU9a5pvhkeG4WwLSdG6zvf/mXGt9CQWjoIbAz9eTQa0AYrWGq
         jWJQ==
X-Gm-Message-State: AC+VfDyj0SPUGqOSDYS3hYJQKBLMBqFM366uuGKOzwahTR60A3XkfpFo
	Le7LZzGlX6Eas4x4rVcRbk/9qDkPunj6QuhAV/NbA214BpUdBmzljsVBZlfzmLcTb4ME6DUm2Ma
	fb6ag7G7+3Ig0KZbAcnqMaQ==
X-Received: by 2002:a1c:7211:0:b0:3f1:728a:1881 with SMTP id n17-20020a1c7211000000b003f1728a1881mr2052013wmc.31.1682615999325;
        Thu, 27 Apr 2023 10:19:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ70FFgxaq7kngAV3kmqtfIdd11f8yMp/CFv4NyF+1cHylAzDbnw4IznX9hsPqVdLe7DOiNRfg==
X-Received: by 2002:a1c:7211:0:b0:3f1:728a:1881 with SMTP id n17-20020a1c7211000000b003f1728a1881mr2051980wmc.31.1682615998938;
        Thu, 27 Apr 2023 10:19:58 -0700 (PDT)
Received: from redhat.com ([2.52.19.183])
        by smtp.gmail.com with ESMTPSA id n20-20020a7bc5d4000000b003f17b96793dsm25084430wmk.37.2023.04.27.10.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 10:19:58 -0700 (PDT)
Date: Thu, 27 Apr 2023 13:19:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Cc: "Reshetova, Elena" <elena.reshetova@intel.com>,
	"Christopherson, , Sean" <seanjc@google.com>,
	Carlos Bilbao <carlos.bilbao@amd.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"kraxel@redhat.com" <kraxel@redhat.com>,
	"dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Dhaval.Giani@amd.com" <Dhaval.Giani@amd.com>,
	"michael.day@amd.com" <michael.day@amd.com>,
	"pavankumar.paluri@amd.com" <pavankumar.paluri@amd.com>,
	"David.Kaplan@amd.com" <David.Kaplan@amd.com>,
	"Reshma.Lal@amd.com" <Reshma.Lal@amd.com>,
	"Jeremy.Powell@amd.com" <Jeremy.Powell@amd.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"dinechin@redhat.com" <dinechin@redhat.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"berrange@redhat.com" <berrange@redhat.com>,
	"tytso@mit.edu" <tytso@mit.edu>,
	"jikos@kernel.org" <jikos@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"leon@kernel.org" <leon@kernel.org>,
	"richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
	"lukas@wunner.de" <lukas@wunner.de>,
	"cdupontd@redhat.com" <cdupontd@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"sameo@rivosinc.com" <sameo@rivosinc.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"security@kernel.org" <security@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Dylan Reid <dylan@rivosinc.com>, Ravi Sahita <ravi@rivosinc.com>
Subject: Re: [PATCH] docs: security: Confidential computing intro and threat
 model
Message-ID: <20230427131542-mutt-send-email-mst@kernel.org>
References: <20230327141816.2648615-1-carlos.bilbao@amd.com>
 <ZEfrjtgGgm1lpadq@google.com>
 <DM8PR11MB575046B6DAA17B41FFED8080E7659@DM8PR11MB5750.namprd11.prod.outlook.com>
 <7502e1af0615c08167076ff452fc69ebf316c730.camel@linux.ibm.com>
 <ZElOfzn37kmesy7e@google.com>
 <DM8PR11MB57509EBCB1E2146C1768A6EEE76A9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <efda0be02fb0b5bf23aec11b5398d20908a821ba.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <efda0be02fb0b5bf23aec11b5398d20908a821ba.camel@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Apr 27, 2023 at 09:18:08AM -0400, James Bottomley wrote:
> I think the problem is that the tenor of the document is that the CSP
> should be seen as the enemy of the tenant. Whereas all CSP's want to be
> seen as the partner of the tenant (admittedly so they can upsell
> services). In particular, even if you adopt (b) there are several
> reasons why you'd use confidential computing:
> 
>    1. Protection from other tenants who break containment in the cloud.
>       These tenants could exfiltrate data from Non-CoCo VMs, but likely
>       would be detected before they had time to launch an attack using
>       vulnerabilities in the current linux device drivers.
>    2. Legal data security.  There's a lot of value in a CSP being able
>       to make the legal statement that it does not have access to a
>       customer data because of CoCo.
>    3. Insider threats (bribe a CSP admin employee).  This one might get
>       as far as trying to launch an attack on a CoCo VM, but having
>       checks at the CSP to detect and defeat this would work instead of
>       every insider threat having to be defeated inside the VM.

And generally, all these are instances of adopting a zero trust
architecture, right? Many CSPs have no need to access VM memory
so they would rather not have the ability.

-- 
MST

