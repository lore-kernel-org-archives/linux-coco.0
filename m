Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB64821D00A
	for <linux-coco@lists.linux.dev>; Wed,  5 Aug 2026 00:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891338; cv=none; b=pDyVbj4oQH3SLW8CulSAdFnPbno/2/kZNnvhkj3IQnxruEN8hG76ED/creXp9hccFPnpfuB9/2on8iFjxJ4lO6EGU5Pu3RFUb9EJXtM22GHr3nIy+oyilL3d8LxTQOkUroJhp68JT2CZq3E7vAjGYPuLjpbNq65+oiSDbVMwQjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891338; c=relaxed/simple;
	bh=L0p0VCpSbh9Cfa3QK1gAYb1bq95q8GTSvQusPpTmsDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDKsvHnZ0w36kV91Q41adPWOipVxpcKTLJ/ttKDXgkWlXcmlk/ludOzH6XKX3pV1tp+hT6nGZ9rH4AfT6j0Zk0h4bbFq3bUI5oYsKhb6p3GJnjFliKWs8uRaIkZjSq7OXBbDpDHpiNx7plWxIgSq+5bceuj6IQjpGIUXegTrZGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BNojs1gS; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BNojs1gS"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9034b6b7674so3049466d6.0
        for <linux-coco@lists.linux.dev>; Tue, 04 Aug 2026 17:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785891336; x=1786496136; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L0p0VCpSbh9Cfa3QK1gAYb1bq95q8GTSvQusPpTmsDI=;
        b=BNojs1gSfvNERvVS71x2+pTbLtKvZo/3vmw4ippGZEkTox7SgaT3aV3034am3nSTiK
         8X0+NVxQTFcjMz8EJwVPcaakAFdRsdYeTP/kDz2k1VYqlAhLUcvlXnnmhM2x+zepDu3z
         fwkZbdclkk6GCnIO86cVrNY5Xr1LKD1zlgUGu9l4iShoZY5b5bhAq6HMfzxCwppkLK2R
         jt26i04sqAj5cxaIL26Vh1dY1P9fK1R7yR55359dPTNEwIQUUQ1LIAXQjehkZ+Y1M0tA
         pIiylyAYgixWUPrNQs2nwaqRUT8UcK7XgPY3FwOBUKb4cMR2fxUjmIkBLrARjGPlVbV5
         S8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785891336; x=1786496136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0p0VCpSbh9Cfa3QK1gAYb1bq95q8GTSvQusPpTmsDI=;
        b=Kds8NMrzkkkrEfI02TC6s7xKb43RTQDKu+DR/byeqIIJfKUGvkszZfhPHcaULu/QPO
         C2ha45rZR8XUkznhs5INi2BX8L9rCOylPVnlSSdszmV/wslHk16OJUYXmq/NwLCoOgtx
         2sMw8w8AuaWZy1umW4vRGHXtv0utIhTydlADK4EMJBUH9FIvVePsEq7Dbd9sYtuLqiAZ
         TNH9HB1X5IE+eWo97ydsFc1mihpxf1wrOVqJImcNTmHwe9dx/xVLQQfvl5+dgnV4yRMm
         NeKfRXdlashWWiQs9q3qVCoR5Qaq8h/ZGVZXx/Jnybz9xSNyCOvu9/6Sbmd94qBrFbs9
         Y86w==
X-Forwarded-Encrypted: i=1; AHgh+RpnKHkDnXaYNAx3ga7ROGMgo/w+UbQ1Q6I4hxfjwhxEnZ2rafYC6JbZOiKeKXf60PYiH8d1juCyur28@lists.linux.dev
X-Gm-Message-State: AOJu0YwtWtq4hO9b4IAWQgFi1I1xKst5hDHGCg8AcCTPKNZWPqOsl5PE
	2cUQhm9PI9jy/65sPQvjr+344XC+eZ/Sm1WvBgBbZCBIzb3DQMrnbgj35wtuUdC/fck=
X-Gm-Gg: AR+sD11HuHtT8U8A7iZJf3i08a/yllcxCCpdqZ9Gz3enlmVrnpfDCESIcxDOg+vtXfZ
	/nZGfIAGUUEc/nNbrfdqLNDhWKIezb1Qg6qTPmOZ7Ssd0F3HRG1c6L+N9gZU+tvcHiiMH9zpG8z
	F5LSaZ4MidVtEEQGaUYhDiDyF/TlWJqEzRbkp9cvce7y4HnaJgOdJWvGkldN2wBA+TTmu50FTWB
	zWCcdMFbEokZ2IHPWszamFseuZPgnzYof+QOoKAMyV1Y9mxyPRn0gL9H7vUGx/Vj3ChkGwaHuyQ
	mjrinQGz7eTfLyoVI6PRrWabdc/FImrKplUQprNXIkmdORD41jc9ZLlY2jWVaAdqEGUT7ZhQSLA
	b+SW4sfZK1CDt3bBjRyk//27rPIutKNX7J+eIF1iClcPIuMet2cM/5kbL62fIc6eexx8/jeNFYn
	oRFz5DLyXOsX07ZWjrMc6ERpSy79sduVSfufleuQ==
X-Received: by 2002:a05:622a:58c7:b0:517:5b2c:6aae with SMTP id d75a77b69052e-52ce5fbdcc4mr38577871cf.13.1785891335649;
        Tue, 04 Aug 2026 17:55:35 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ce87aa1a3sm6538131cf.6.2026.08.04.17.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 17:55:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wrPuv-00000000Cli-34Ni;
	Tue, 04 Aug 2026 21:55:33 -0300
Date: Tue, 4 Aug 2026 21:55:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org, driver-core@lists.linux.dev,
	ankita@nvidia.com, Aaron Tomlin <atomlin@atomlin.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, Petr Pavlu <petr.pavlu@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>,
	"Fontenot, Nathan" <Nathan.Fontenot@amd.com>,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <20260805005533.GB28508@ziepe.ca>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com>
 <amk7Xzm5jmz+6SPJ@ziepe.ca>
 <anFE7m164AmchTy/@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anFE7m164AmchTy/@yilunxu-OptiPlex-7050>

On Tue, Aug 04, 2026 at 09:48:30AM +0800, Xu Yilun wrote:

> Glad to see you all here to make progress! Intel can also help on this.
> Can we have a meeting to discuss on these topics? As Alexey mentioned,
> previously we had a bi-weekly call, perhaps use that for our first
> meeting? Or what time works best for everyone?

I prefer we defer such community discussions till September, that
seems appropriate given some dates I've seen.

Jason
