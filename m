Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C1468B
	for <linux-coco@lists.linux.dev>; Mon, 24 Oct 2022 19:18:28 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id sc25so7241574ejc.12
        for <linux-coco@lists.linux.dev>; Mon, 24 Oct 2022 12:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iW9VP26spPfXaZ2mheZkEjEoMacNnC/LuneeKmV+IqU=;
        b=e/jwPieedvWB+Fns1B8rTwV3lDPdo7cFHoLK9Eja7rOjs1QUeDNvWc36Bv5USCsGKn
         zJOMoQXyDUfeEq06NvJLGjGir/c9WcXoUvaCTOavgHrprwC1++qa5EsV5TNL7oRryhXN
         aQ5zPSbbHZ+aXyXkIfTp8Wo+cIjEx84UQGAqUbiTnmQ9i9xVicEpSt/IgTY1Syz0nW6N
         4ybAY2nq60fRiIZJKdoR9CQDWKiNrV0gWWwlcRmEtcexWPEYtixW7fwZrp4aEurpO6sd
         QS/ShMyZrMj38ByN2rAj8d50OB9R+4Pnn2cnpawVsnGXs8dmhczrQYbhTOrhLg6fFyDR
         okcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iW9VP26spPfXaZ2mheZkEjEoMacNnC/LuneeKmV+IqU=;
        b=VSKnoJtZEHdzs/uKsgBVpKrdBc4B04+KxA00VBZDHDstpywe1+02eIcWhn/aMFIDhW
         DRc3FlpeVLwCp+qm7u0DFQ/afgmV5FWM16REhYrJFHAPYW+6XAW2XxqbwmjID5bUBHpi
         Sg17+1DJKBDRMv9Vfv2rYO9doihjgFatI0KVhgWhGclBv/6eV1BjpgadGDgyV9ZC0tfb
         6PFloHLRAw3rfzexciE0xKGIQZUMz6Zhl9mFki9ElbvIX521FHAW3KdFnHO9AiUuSDt8
         MdmtiuO82tiZjkmOGIN1K53rUCuum3e/9tGtoJsqlU5yxKDbdfjmz4weR68QcH8x2mlw
         6ZJw==
X-Gm-Message-State: ACrzQf38KZVVO5iRy4hH48NfNFpCM0xLhDEKs3O9mBx+4TIfGvvgl+nI
	9PFLVS11+u1QtF+JXW/jiPzd8GXxpbSZInesqPvv0g==
X-Google-Smtp-Source: AMsMyM7vHsjUNVa4STHEuT1RNRyvZPhoNZfHor3g3DaX0+VVpstG8kG4vDFEWNM5doDET2ORaCPM2Km1rrk6hp4iqGk=
X-Received: by 2002:a17:907:628f:b0:72f:58fc:3815 with SMTP id
 nd15-20020a170907628f00b0072f58fc3815mr29246891ejc.719.1666639106428; Mon, 24
 Oct 2022 12:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com> <8080a626-114e-b358-bb36-a7b5583ff2f0@linux.ibm.com>
 <58b2bcdb-583b-ccc5-cffb-500ade7fbdab@amd.com> <SJ0PR21MB132342D2808DF609F37D6018E92B9@SJ0PR21MB1323.namprd21.prod.outlook.com>
 <CABayD+cYCj=uOtC5h1d781jh_B6XqxmZNfR69taEex7yvkizRw@mail.gmail.com>
 <SJ0PR21MB132378C080FFED1E283B4051E92A9@SJ0PR21MB1323.namprd21.prod.outlook.com>
 <f9af0f4b95ea6fe3e488d24f5070ab71c2da3eb4.camel@linux.ibm.com>
 <MN0PR21MB3072186C88BB26EA883F8612CA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <7e67f33577aaebe09205c9a93597de9f742fd08f.camel@linux.ibm.com>
 <MN0PR21MB307280C94C1C54497ADDEFCECA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y1ZwJvNvky6Wst7k@work-vm> <d8b21444-7829-5f5c-41dd-b103ae3a52fa@linux.ibm.com>
 <682a4227-aa79-298c-2ced-5f401c9d4339@amd.com>
In-Reply-To: <682a4227-aa79-298c-2ced-5f401c9d4339@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 24 Oct 2022 12:18:15 -0700
Message-ID: <CAAH4kHZqmKfnSB3p1VJ+-iD2fAFgYpzt5a5Lqy=tB8E=MWaq2w@mail.gmail.com>
Subject: Re: SVSM vTPM specification
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Jon Lange <jlange@microsoft.com>, James Bottomley <jejb@linux.ibm.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	David Altobelli <David.Altobelli@microsoft.com>, 
	Christophe de Dinechin <cdupontd@redhat.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Content-Type: text/plain; charset="UTF-8"

> Having said that, JSON can be represented a number of ways and so
> canonicalizing the output would be necessary. I found RFC 8785
> (https://www.rfc-editor.org/info/rfc8785) but I'm not sure it's truly a
> standard. Are there any better document formats that would be better?
>

CBOR is used for this kind of purpose in Nitro enclaves, the Open DICE
profile, and the CoRIM standard from IETF uses CBOR for representing
SBOM-kinds of things.

-- 
-Dionna Glaze, PhD (she/her)
