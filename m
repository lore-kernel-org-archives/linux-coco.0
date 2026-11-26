Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706091;
	b=31JTt9+FvKYGNrdkAB+z+GCXXvOuEapLvv9CyrEdh3nWYM7WzJ9YUBCdUEPZIlniBlWq
	 zXYBh5OQ/QpuDm2FaNVFRS+ZcRjwWDHE7qhp6I8D7QJGRFKw/7ZOcIxzt4QRFYKKilqHz
	 gZ7c9VY8J+BJjrnIzggUJDBjLDRYUrpE6r4w2EClSgMsOrDI4e5Nq56uFCIiS/a1cGYdd
	 BJtWlagaLdoRTrlVF6NmqhyJLBLjHEO7G63t8DpcuNDi1S36ONz8nooylm+bVxdvTEFzZ
	 CmVwr7TOzVm1ZO6H+9aOaVWXOvlsHTciFQimO4cuOe1Mm1PzGoH8wLoi8oHPBMCG1sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Fmk7KvplZu8IqXCFaSm0h6pjbCmnVJRD63HoP6Br6hc=;
	b=Qn1xbd0lL3Dy7B0FVLgrQN98NZ9Y52nVNWmBtdaHYRRda5CHV//ZhDw8jvuFJUgntwy2
	 UjzIWE+/AGZn+lf0iQq1+SiArN1TA+0WAKZ078gDtrDgjsisMDGjZNPSn2AtgrX+Fs4H7
	 BigFVMqZEFBXyXcjAlAwjFKAxyS7ARrcNLyTL0cY31M1+kayL5DePoZbAKY9QxWsSg2QT
	 YanNzX+UjZgrmyrzerASpiTR6r4J26SuFeGbmbl6eQ+9axYPCFsUbwB/KFTkWPe943bwD
	 15ha1Vqae1p3BuzLwfTbi4aVjVALH7rCPs8owRc4jaNl0xwkbuTzJ8ePC0oBCQTgNqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CED606A321
	for <linux-coco@lists.linux.dev>; Thu, 26 Nov 2026 15:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6CED606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so3800980241.2
        for <linux-coco@lists.linux.dev>; Thu, 26 Nov 2026 07:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795706090; x=1796310890; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fmk7KvplZu8IqXCFaSm0h6pjbCmnVJRD63HoP6Br6hc=;
        b=CjppQh2P+eyPwIOGQ+UmQnp0d/uhx6KyOfYxZ1uLohZRS058XnYrvmbv+/Qjv0ukqG
         7Dy32TqKPbXN3l5CktAYXcA/UFbUztNlVw0g4hpjysx71DuwNS/rQgyqmnMeqStBLiVN
         AWF5vEYXxIVCAala3lN01DcnrvhPE7AhqtWZ8r9+ZN6HhvaqoMJvSOh3FCVwJYetpVIS
         IprLpA4BzdiNSI2M3rULDrqLTHtM/YPQJ3B/4yt5dj+SkNPuHWCQ/t/3FNV3xEGfDggu
         qHNelrHPWJs3IpeOG1j/TNm9qczucuOdVDsmRQMQSMq6r7isSg+lmOcHQhAAsfPl47yE
         1nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706090; x=1796310890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fmk7KvplZu8IqXCFaSm0h6pjbCmnVJRD63HoP6Br6hc=;
        b=eJc3/XuodqHHDhKWhUvWvythHUmEolEgWCjaOa64I0N5MztQSV7V8pd7XOaH8ZHwCQ
         6ALFFbECOp/5nzT6raypetJ4j6ppVyenjtCWE9q9v1/U6f1QsZ/VOfqZPXJl9o0QlK67
         SMHHbURTNFdj1LBffeZMbGEGzPx/pgyJsVtRrOobgqUFi/EFJdzkCU1O0lK+R5Yb4t4S
         sgWUerOmTPruv1rpG/3ymTqSgRGPRFHOFKGa+ljfRdU8UItQhatpQbCFUa24rg+p6tad
         0QdHXrIYjD3gCTsjY+Xy8O35gsI6W+Xtjqh3G4X+r2HVZqMgyhM7Z5vg85O1yRvXDVJA
         /Hyw==
X-Forwarded-Encrypted: i=1; AL+hErHMDgDY5eF3EOOe2fyvohpey6i/qSxyfMUr4qtb4yDsh4pK36+IJvRrTXb+M/kMdenwn9rhDaaWu3T0@lists.linux.dev
X-Gm-Message-State: APuU4Z/3x2yYfAK7TmWSG1yZajxOD6OiR0v2AH+cCLvxfNDq6BzkYxw4
	q4Wymoq4Dvd+1ScPzAteeHiCr00Lm6vtJm5HHg7Dh20qs8+ZqyCPPJHTbUZfGafLUjo=
X-Gm-Gg: AZFdTZdt9s5BXc6bf/fkUrRKiENKaRcNeKCtEhpR0d1vJEI+OMPotlnMayqzJ2J31m6
	F/LAaYBXkFN0du05AVZ8Y/FY37UVot6smJSh/ZX5uZd4vKUftWMhnhyZjSVCNt2Vw248Po89H79
	AIc5/YdqZna4KBU1527YnEed6BfQAii2EuND1GAQ+lC9PC4FfjJFJSKkhS2onNG8GiDHGeThCaX
	YtLYHY54KnvGOKN/FDcSnXuWmT74wFReLgGvD9N/fbsL+tYnYahT0U6SSxDxI1QMlGU952m898+
	jmj2xb0Nm3GazJCsB6N8YVFpE+4XDKKsKRAbwi6vnN1UWDjPhNBe2xhMYbCeGr2WFRzZcHFwgP2
	WrwIlj8F+Npj99IheSR5ROIlY6c3FFw5YoUWjw0FpLPLMAhwvknOmXMfvbZNKrAhw3ymW0cs1No
	FpGdcOaN6XDnH22Rzh4tSVeZs9uVvWxEfqxBd6XOUdaxqNQn/0QYUcSn3zRFCOYSDMioAL9EMEy
	fsXYwrRSUPeJLYcupFpwh16gzr9FWcGGLJIg096kuAX4HboEN13DNbdTXIgZp6m96ClHPIK5NFx
	n6UN0SI=
X-Received: by 2002:a05:6102:84c8:b0:7c3:2168:d603 with SMTP id ada2fe7eead31-7d71e329ce9mr10299312137.0.1795706089640;
        Thu, 26 Nov 2026 07:14:49 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cdfbasm193141456d6.17.2026.11.26.07.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:14:49 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWbBQ-00000004NdO-2PDc;
	Thu, 26 Nov 2026 11:14:48 -0400
Date: Thu, 26 Nov 2026 11:14:48 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev,
	Dan Williams <djbw@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 04/10] PCI/TSM: Defer TSM vDEVICE allocation until
 device setup completes
Message-ID: <20261126151448.GO246011@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-5-aneesh.kumar@kernel.org>
 <5e04323f-dfdc-4956-acee-bcc09926726d@amd.com>
 <yq5aqzg99uio.fsf@kernel.org>
 <20261125141947.GD246011@ziepe.ca>
 <yq5ald6gul7q.fsf@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ald6gul7q.fsf@kernel.org>

On Thu, Nov 26, 2026 at 12:34:57PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Wed, Nov 25, 2026 at 02:07:19PM +0530, Aneesh Kumar K.V wrote:
> >
> >> That is what this patch does. If IDE setup is not complete but the
> >> device already has tsm0 attached and connected, pci_tsm_context_get()
> >> returns an error from cca_vdevice_init(), preventing the device from
> >> being assigned to the VM.
> >
> > If the device has not been fully accepted on the SPDM side then you
> > should not be able to create an iommufd vdevice for it, nothing else.
> 
> That is what this patch does.

Well, it doesn't exactly. It adds some code without any users and
doesn't explain why we need to export a lock or add more core code for
this activity.

Nor does any of the naming imply it is only to be used for iommufd
vdevices.

It is problematic to be hacking the core code without any drivers, I
know we are kind of stuck with this, but lets try to limit changes to
supporting stuff that is potentially about to be merged. viommu is
fairly down the road still due to all the dependencies.

Jason
